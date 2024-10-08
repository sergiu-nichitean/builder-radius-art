class CollectionsController < ApplicationController
  before_action :init_collection_params, only: %i[create update]
  skip_before_action :authenticate_user!, only: %i[ show mint ]
  skip_before_action :verify_authenticity_token, only: %i[ show mint ]

  def create
    collection = current_user.create_collection(@collection_params)
    path_type = collection.type.gsub('Collection', '').underscore

    if collection.id.present?
      redirect_to nft_creator_path, notice: 'NFT collection was created successfully.'
    else
      redirect_to eval("nft_creator_#{path_type}_path"), alert: collection.errors.full_messages.to_sentence
    end
  end

  def update
    collection = current_user.collection

    if collection.update(@collection_params)
      redirect_to nft_creator_path, notice: 'NFT collection was successfully updated.'
    else
      redirect_to nft_creator_path, alert: collection.errors.full_messages.to_sentence
    end
  end

  def show
    api_auth
    set_collection
  rescue => error
    render json: { error: error }
  end

  def mint
    if request.content_type == 'application/json'
      api_mint
    else
      html_mint
    end
  end

  def api_mint
    api_auth
    set_collection
    @site = @collection.user.site

    mint_flow

    render json: { message: "NFT minted successfully" }
  rescue => error
    render json: { error: error }
  end

  def html_mint
    authenticate_user!
    @collection = current_user.collections.find_by(type: @collection_params[:type])
    @site = current_user.site

    mint_flow

    redirect_to nft_creator_path, notice: 'NFT minted successfully. It can take several minutes until the NFT appears in your wallet.'
  rescue => error
    redirect_to nft_creator_path, alert: error
  end

  def mint_flow
    if @site&.finished?
      remote_transactions = HTTParty.get("https://radius.art/wp-json/nftbuilder/v1/transactions/#{@site.remote_id}",
        basic_auth: Site.wp_authentication,
        headers: { 'Content-Type' => 'application/json' }
      )

      current_supply = remote_transactions.count
    else
      current_supply = @collection.current_supply
    end

    token_id = current_supply + 1

    if collection.max_supply && (token_id > collection.max_supply)
      raise 'The maximum NFT supply has been reached.'
    end

    token_name = "#{@collection.name} ##{token_id}"

    @collection.update(current_supply: token_id)

    if @site&.finished?
      HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/transactions/#{@site.remote_id}",
        body: {
          token_name: token_name,
          token_id: token_id,
          external_id: params[:receiver_wallet]
        }.to_json,
        basic_auth: Site.wp_authentication,
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    underdog_response = HTTParty.post("https://mainnet.underdogprotocol.com/v2/projects/#{@collection.remote_id}/nfts",
      body: {
        name: token_name,
        tokenId: token_id,
        description: @collection.description,
        symbol: 'RADIUS',
        image: @collection.image_url,
        animationUrl: @collection.animation_url || @collection.image_url,
        externalUrl: @site&.finished? ? "https://#{@site.subdomain}.#{Rails.configuration.root_domain}" : 'https://radius.art',
        receiverAddress: params[:receiver_wallet]
      }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{Rails.application.credentials.underdog_api_key}"
      }
    )

    if underdog_response['message']
      raise underdog_response['message']
    elsif underdog_response['transactionId'].nil?
      raise 'Error minting NFT, please contact support (code 0006).'
    end
  end

  private

  def set_collection
    @collection = Site.find_by(remote_id: params[:id]).user.collection
  end

  def init_collection_params
    params_key = :collection

    unless params.keys.include?(params_key.to_s)
      params_key = params.keys.find{ |k| k.ends_with?('_collection') }.to_sym
    end

    @collection_params = params.require(params_key).permit(
      :image, :animation, :name, :description, :max_supply,
      :treasury_wallet, :price_sol, :song_id,
      :flight_number, :origin, :destination, :departure_date,
      :departure_time, :arrival_date, :arrival_time, :royalties_percent,
      :royalties_wallet, :collection_description, :collection_image,
      :type, :collection_name, :open_edition
    )
  end
end
