class WebsiteCreatorController < ApplicationController
  def index
    @site = current_user.site || Site.new
    @builder = true
    @active_page = 'website_creator'

    @collection_type = current_user.collection&.type || "#{params[:type]}_collection".camelcase
    @path_type = params[:type] || @collection_type.gsub('Collection', '').underscore

    if @site.finished?
      @use_preview_api = true
      @preview_url = "https%3A%2F%2F#{current_user.site.subdomain}.#{Rails.configuration.root_domain}%2F"
      @uses_right_column = true
    end
  end
end
