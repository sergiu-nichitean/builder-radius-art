class TokengatingController < ApplicationController
  def index
    @builder = true
    @active_page = 'tokengating'
    @uses_right_column = true
    @use_preview_api = true
    @preview_url = "https%3A%2F%2F#{current_user.site.subdomain}.#{Rails.configuration.root_domain}%2F"
  end
end
