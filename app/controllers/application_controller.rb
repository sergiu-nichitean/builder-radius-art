class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def upload_remote_media(params, attribute)
    return unless params[attribute]

    response = HTTParty.post(
      "https://#{current_user.site.domain}/wp-json/wp/v2/media/",
      body: { file: File.open(params[attribute].tempfile.path) },
      basic_auth: Site.wp_authentication
    )

    params[:"#{attribute}_remote_id"] = response['id']
    params[:"#{attribute}_remote_url"] = response['source_url']
    params.delete(attribute)
  end

  def api_auth
    return if params[:api_key] == '7[V[U]q\'ZZG9\\=1!Y-X:qt'

    raise 'Invalid API key'
  end
end
