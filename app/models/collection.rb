class Collection < ApplicationRecord
  belongs_to :user

  before_create :create_remote_collection
  before_save :handle_name
  after_save :update_site
  after_save :update_traits

  has_one_attached :animation
  has_one_attached :image
  has_one_attached :collection_image

  validates :name, length: { minimum: 1, maximum: 27, message: 'can be between 1 and 27 characters long' }
  validates :description, presence: true
  validates :image, presence: true
  validates :max_supply, numericality: { greater_than: 1 }, if: -> { open_edition? == false }
  validates :royalties_wallet, length: { is: 44, message: 'is not a valid Solana address' }, if: -> { royalties_percent.present? }

  def animation_url
    return animation.url.split('?').first if animation.url.present?
  end

  def image_url
    return image.url.split('?').first if image.url.present?
  end

  def collection_image_url
    if collection_image.url.present?
      collection_image.url.split('?').first
    elsif image.url.present?
      image_url
    end
  end

  def edit_path; end

  def nft_field_categories
    []
  end

  def website_field_categories
    []
  end

  def page_title
    'Generic NFT Collection'
  end

  protected

  def handle_name; end

  def update_site
    return unless user.site&.finished?

    user.site.update(
      nft_image_remote_url: image_url,
      nft_animation_remote_url: animation_url,
      nft_name: name,
      nft_description: description,
      max_supply: max_supply
    )
  end

  def create_remote_collection
    return

    underdog_response = HTTParty.post("https://mainnet.underdogprotocol.com/v2/projects",
      body: {
        name: collection_name || name,
        image: collection_image_url,
        description: collection_description || description,
        sellerFeeBasisPoints: royalties_percent.to_f * 100
      }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{Rails.application.credentials.underdog_api_key}"
      }
    )

    if underdog_response['message']
      raise underdog_response['message']
    elsif underdog_response['projectId'].nil?
      raise 'Error creating collection, please contact support (code 0007).'
    end

    self.remote_id = underdog_response['projectId']
  end

  def update_traits
    # return unless user.site&.finished?

    # HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/traits/#{user.site.remote_id}",
    #   body: {
    #     'Flight number': flight_number,
    #     'Origin': origin,
    #     'Destination': destination,
    #     'Departure date': "#{departure_date} #{departure_time}",
    #     'Arrival date': "#{arrival_date} #{arrival_time}"
    #   }.to_json,
    #   basic_auth: Site.wp_authentication,
    #   headers: { 'Content-Type' => 'application/json' }
    # )
  end
end
