class CreateWebsiteWorker
  include Sidekiq::Worker

  def perform(site_id)
    site = Site.find(site_id)

    begin
      # Always set to radius.art
      full_domain = "#{site.subdomain}.radius.art"
if false
      wu_authentication = { username: Rails.application.credentials.wu_username, password: Rails.application.credentials.wu_password }

      body = {
        customer: {
          username: "#{Rails.configuration.site_name}_user_#{site.user.id}_d",
          password: "Remote_password_#{site.user.id}_00!!",
          email: "#{Rails.configuration.site_name}_user_#{site.user.id}_d@#{Rails.configuration.root_domain}"
        },
        membership: { status: 'active' },
        products: [4],
        payment: { status: 'completed' },
        site: {
          site_url: site.subdomain,
          site_title: site.title,
          template_id: 95
        }
      }

      response = HTTParty.post('https://radius.art/wp-json/wu/v2/register',
        body: body.to_json,
        basic_auth: wu_authentication,
        headers: { 'Content-Type' => 'application/json' }
      )

      if response['message']
        raise response['message']
      end

      remote_site = nil

      100.times do
        all_sites = HTTParty.get('https://radius.art/wp-json/wu/v2/site', basic_auth: wu_authentication)
        remote_site = all_sites.find{ |site| site['domain'] == full_domain }

        if remote_site.nil?
          sleep 10
        else
          break
        end
      end

      raise 'Error creating website, please contact support (code 0005)' unless remote_site
      raise 'No NFT collection found' unless site.user.collection.present?
end
      collection = site.user.collection
      full_domain = "#{site.subdomain}.#{Rails.configuration.root_domain}"

      site_data = {
        # remote_id: remote_site['blog_id'],
        front_page_id: 260,
        twitter: 'https://x.com/radius__art',
        discord: 'https://discord.gg/fraNru2Qe4',
        instagram: '',
        logo_remote_id: 802,
        logo_remote_url: 'https://builder-template.radius.art/wp-content/uploads/sites/95/2023/03/white_logo_transparent_background.png',
        icon_remote_id: 793,
        icon_remote_url: 'http://builder-template.radius.art/wp-content/uploads/sites/95/2023/03/cropped-logo_color_round-1.png',
        nft_image_remote_url: collection.image_url,
        nft_animation_remote_url: collection.animation_url,
        nft_name: collection.name,
        nft_description: collection.description,
        max_supply: collection.max_supply,
        open_edition: collection.open_edition?,
        symbol: 'RADIUS',
        external_url: "https://#{full_domain}",
        mint_button_text: 'MINT NFT',
        mint_page_title: 'Get Your Digital Collectible!',
        mint_page_content: 'Write some catchy content here.<br>Don’t forget about the call-to-action!',
        banner_remote_url: 'https://builder-template.radius.art/wp-content/uploads/sites/95/2024/04/background-2.png',
        contact_email: 'hello@radius.art',
        contact_page_content: 'Send us a message using the form or at hello@radius.art. We will get back to you in maximum 48 hours.',
        collection_remote_id: collection.remote_id,
        price_sol: '0.001',
        treasury_wallet: '9M3TXfSCY87CDTppVti5St7LnoFt7GrmXQFFTQjBk9q8',
        tokengating_title: 'Members Area',
        tokengating_content: '<p>Add you exclusive content here, HTML accepted.</p>'
      }

      # HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/change-subdomain/#{remote_site['blog_id']}",
      #   body: { new_domain: full_domain }.to_json,
      #   basic_auth: Site.wp_authentication,
      #   headers: { 'Content-Type' => 'application/json' }
      # )

      site.update(site_data)

      HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/nft-details/#{site.remote_id}",
        body: site.nft_details.merge(underdog_project_id: collection.remote_id).to_json,
        basic_auth: Site.wp_authentication,
        headers: { 'Content-Type' => 'application/json' }
      )

      # underdog_response = HTTParty.get("https://mainnet.underdogprotocol.com/v2/projects/#{collection.remote_id}",
      #   headers: {
      #     'Content-Type' => 'application/json',
      #     'Authorization' => "Bearer #{Rails.application.credentials.underdog_api_key}"
      #   }
      # )

      # if underdog_response['message']
      #   raise underdog_response['message']
      # elsif underdog_response['mintAddress'].nil?
      #   raise "Error creating website, please contact support (code 0008). #{underdog_response}"
      # end

      # HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/tokengating/#{site.remote_id}",
      #   body: {
      #     gated_url: "https://#{full_domain}/members-area/",
      #     error_url: "https://#{full_domain}/token-gated-content/",
      #     collection_address: underdog_response['mintAddress']
      #   }.to_json,
      #   basic_auth: Site.wp_authentication,
      #   headers: { 'Content-Type' => 'application/json' }
      # )

      site.update(status: :finished)
    rescue  => error
      site.update(error: error, status: :error)
    end
  end
end
