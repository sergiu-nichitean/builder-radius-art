class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :webhook
  skip_before_action :authenticate_user!, only: :webhook

  def new
    @include_payments_js = true
    @countries = Payment::COUNTRIES
    # @eu_countries = Payment::EU_COUNTRIES
    @payment = Payment.new
  end

  def create
    @payment = Payment.new
    assign_payment_params

    if @payment.save
      render json: { payment: { id: @payment.id, credits: @payment.credits }, status: :ok }
    else
      render json: { error: @payment.errors.full_messages.to_sentence }, status: :ok
    end
  end

  def create_payment_intent
    customer = if current_user.stripe_customer_id
                 Stripe::Customer.retrieve(current_user.stripe_customer_id)
               else
                 create_stripe_customer
               end

    payment_intent = create_stripe_payment_intent(customer, params[:payment][:credits])
    client_secret = payment_intent.client_secret

    render json: { customer_id: customer.id, payment_intent_id: payment_intent.id, client_secret: client_secret }
  rescue => error
    render json: { error: error.message }
  end

  def update
    @payment = Payment.find_by(id: params[:id], user_id: current_user.id)

    if @payment.update(status: 'complete', amount: (@payment.credits / Payment::CREDITS_PER_DOLLAR))
      flash.notice = "You successfully bought #{@payment.credits} credits, enjoy!"
      current_user.update(credits: current_user.credits + @payment.credits)
      render json: { success: true }, status: :ok
    else
      render json: { error: @payment.errors.full_messages.to_sentence }, status: :ok
    end
  end

  private

  def payment_params
    params.require(:payment).permit(
      :address_line_1, :address_line_2, :city, :state, :postal_code, :country, :company_name,
      :vat_id, :stripe_customer_id, :external_id, :id, :amount, :credits
    )
  end

  def create_stripe_customer
    customer_data = {
      email: current_user.email,
      # address: {
      #   city: payment_params[:city],
      #   country: payment_params[:country],
      #   line1: payment_params[:address_line_1],
      #   line2: payment_params[:address_line_2],
      #   postal_code: payment_params[:postal_code],
      #   state: payment_params[:state]
      # }
    }

    customer_data[:name] = if payment_params[:company_name].present?
                             payment_params[:company_name]
                           else
                             "#{current_user.first_name} #{current_user.last_name}"
                           end

    # if payment_params[:vat_id].present?
    #   customer_data[:tax_id_data] = [
    #     {
    #       type: 'eu_vat',
    #       value: payment_params[:vat_id]
    #     }
    #   ]
    # end

    customer = Stripe::Customer.create(customer_data)
    current_user.update(stripe_customer_id: customer.id)
    customer
  end

  def create_crypto
    @payment = Payment.new

    @payment.assign_attributes(
      user_id: current_user.id,
      status: 'complete',
      credits: params[:credits],
      amount: (params[:credits].to_f / Payment::CREDITS_PER_DOLLAR)
    )

    if @payment.save
      flash.notice = "You successfully bought #{@payment.credits} credits, enjoy!"
      current_user.update(credits: current_user.credits + @payment.credits)
      render json: { success: true }, status: :ok
    else
      render json: { error: @payment.errors.full_messages.to_sentence }, status: :ok
    end
  end

  def create_stripe_payment_intent(customer, credits)
    order_description = "Radius.art Builder - #{credits} credits"

    invoice_item = Stripe::InvoiceItem.create(
      customer: customer.id,
      unit_amount: (credits.to_i / Payment::CREDITS_PER_DOLLAR) * 100,
      quantity: 1,
      currency: 'USD',
      description: order_description
    )

    invoice_params = { customer: customer.id, currency: 'USD', pending_invoice_items_behavior: 'include' }
    invoice = Stripe::Invoice.create(invoice_params)

    Stripe::Invoice.finalize_invoice(invoice.id)

    # refresh invoice so it contains payment intent
    invoice = Stripe::Invoice.retrieve(invoice.id)
    payment_intent = Stripe::PaymentIntent.retrieve(invoice.payment_intent)

    Stripe::PaymentIntent.update(payment_intent.id, description: order_description)

    payment_intent
  end

  def assign_payment_params
    @payment.assign_attributes(
      payment_params.merge(
        user_id: current_user.id,
        status: 'incomplete'
      )
    )
  end
end
