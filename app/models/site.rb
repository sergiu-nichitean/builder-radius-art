class Site < ApplicationRecord
  enum status: [:pending, :finished, :error]

  belongs_to :user

  before_save -> do
    self.subdomain.downcase!
    self.preview_version = preview_version.to_i + 1
  end

  after_update :update_remote

  validates :title, presence: true
  validates :subdomain, {
    presence: true,
    uniqueness: { message: 'is already taken' },
    format: {
      with: /\A(?!-)[A-Za-z0-9-]+(?<!-)\z/,
      message: 'can only contain letters, numbers, and hyphens'
    }
  }

  def self.wp_authentication
    { username: Rails.application.credentials.wp_username, password: Rails.application.credentials.wp_password }
  end

  def domain
    "#{subdomain}.#{Rails.configuration.root_domain}"
  end

  def update_remote
    return

    # site identity
    if saved_change_to_either_attribute? [:title, :icon_remote_id, :logo_remote_id]
      remote_update_settings(title: title, site_icon: icon_remote_id, site_logo: logo_remote_id)
    end

    if saved_change_to_attribute?(:subdomain)
      remote_update_custom_settings('nft-details', nft_details)
      remote_update_custom_settings('change-subdomain', new_domain: "#{subdomain}.#{Rails.configuration.root_domain}")
    end

    # NFT details
    if saved_change_to_either_attribute? [
      :nft_image_remote_url, :nft_animation_remote_url, :nft_name,
      :nft_description, :max_supply, :open_edition, :treasury_wallet,
      :symbol, :external_url
    ]
      remote_update_custom_settings( 'nft-details', nft_details)
    end

    # Mint Page
    if saved_change_to_either_attribute? [
      :banner_remote_url, :mint_page_title, :mint_page_content,
      :free_mint, :price_sol
    ]
      remote_update_custom_settings(
        'mint-page',
        page_id: front_page_id,
        banner_remote_url: banner_remote_url,
        mint_page_title: mint_page_title,
        mint_page_content: mint_page_content,
        # free_mint: free_mint ? 'on' : 'off',
        free_mint: 'off',
        price_sol: price_sol
      )
    end
  end

  def remote_update_settings(params)
    HTTParty.post("https://#{domain}/wp-json/wp/v2/settings/",
      body: params.to_json,
      basic_auth: Site.wp_authentication,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def remote_update_custom_settings(endpoint, params)
    if saved_change_to_attribute?(:nft_image_remote_url)
      remote_update_main_asset
    end

    HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/#{endpoint}/#{remote_id}",
      body: params.to_json,
      basic_auth: Site.wp_authentication,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def remote_update_main_asset
    HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/main-asset/#{remote_id}",
      body: { page_id: front_page_id, asset_url: nft_image_remote_url }.to_json,
      basic_auth: Site.wp_authentication,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def nft_details
    {
      nft_image_remote_url: user.collection.image_url,
      nft_animation_remote_url: user.collection.animation_url,
      nft_name: user.collection.name,
      nft_description: user.collection.description,
      symbol: 'RADIUS',
      external_url: "https://#{domain}",
      max_supply: user.collection.max_supply,
      # open_edition: open_edition ? 'on' : 'off',
      open_edition: 'off',
      treasury_wallet: treasury_wallet
    }
  end

  def collection
    user.collection
  end

  private

  def saved_change_to_either_attribute?(attributes)
    changed = false

    attributes.each do |attribute|
      if saved_change_to_attribute?(attribute)
        changed = true
        break
      end
    end

    changed
  end
end
