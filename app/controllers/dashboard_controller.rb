class DashboardController < ApplicationController
  def index
    current_user.update(
      ip_address: request.remote_ip,
      user_agent: request.user_agent
    )

    if current_user.collection.present?
      redirect_to nft_creator_path
    else
      @active_page = 'nft_creator'
    end
  end

  def log_click
    ClickEvent.create(user_id: params[:user_id], click_data: params[:click_data])
  end
end
