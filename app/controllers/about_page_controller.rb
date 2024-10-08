class AboutPageController < ApplicationController
  def index
    @active_page = 'about_page'
    @preview_url = "https%3A%2F%2F#{current_user.site.subdomain}.#{Rails.configuration.root_domain}%2Fabout%2F"
  end
end
