class SitesController < ApplicationController
  before_action :init_site_params, only: %i[create update]
  skip_before_action :authenticate_user!, only: %i[ show ]

  def show
    respond_to do |format|
      format.html do
        authenticate_user!
        render json: current_user.site
      end

      format.json do
        api_auth
        render json: Site.find_by(remote_id: params[:id])
      end
    end
  end

  def create
    site = current_user.create_site(@site_params)

    if site.id.present?
      CreateWebsiteWorker.perform_async(site.id)

      redirect_to website_creator_path, notice: 'Site creation has been queued, please wait for it finish.'
    else
      redirect_to website_creator_path, alert: site.errors.full_messages.to_sentence
    end
  end

  def update
    upload_remote_media(@site_params, :icon)
    upload_remote_media(@site_params, :logo)
    upload_remote_media(@site_params, :banner)

    if current_user.site.update(@site_params)
      redirect_to website_creator_path, notice: 'Site was successfully updated.'
    else
      redirect_to website_creator_path, alert: current_user.site.errors.full_messages.to_sentence
    end
  end

  def retry
    current_user.site.destroy

    redirect_to website_creator_path
  end

  private

  def init_site_params
    @site_params = params.require(:site).permit(
      :title, :subdomain, :logo, :icon,
      :mint_page_title, :mint_page_content, :banner,
      :price_sol, :free_mint, :email_claim, :treasury_wallet,
      :latitude, :longitude, :start_date, :start_time,
      :end_date, :end_time, :tokengating_title, :tokengating_content
    )
  end
end
