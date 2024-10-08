class MintPageController < ApplicationController
  def index
    @builder = true
    @active_page = 'mint_page'
    @preview_url = "https%3A%2F%2F#{current_user.site.subdomain}.#{Rails.configuration.root_domain}%2F"
  end
end
