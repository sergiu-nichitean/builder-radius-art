class NftCreatorController < ApplicationController
  def index
    if params[:type].nil? && current_user.collection.nil?
      redirect_to root_path
      return
    end

    @collection_type = current_user.collection&.type || "#{params[:type]}_collection".camelcase
    @path_type = params[:type] || @collection_type.gsub('Collection', '').underscore

    if current_user.collection.nil? || current_user.collection.type == @collection_type
      @collection = current_user.collection || eval(@collection_type).new
      @form_url = @collection.id.present? ? "/collections/#{@collection.id}" : '/collections'

      @active_page = 'nft_creator'
      @uses_right_column = true
      @preview_url = "/images/wallet_preview.png"
    else
      redirect_to root_path
    end
  end
end
