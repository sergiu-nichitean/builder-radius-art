class BlinkController < ApplicationController
  def index
    @builder = true
    @active_page = 'blink'
    # @use_preview_api = true
    @uses_right_column = true
    @preview_url = "/images/blink_preview_2.png"
  end
end
