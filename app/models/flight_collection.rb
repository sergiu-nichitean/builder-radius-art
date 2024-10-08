class FlightCollection < Collection
  # TODO: hash with traits

  validates :max_supply, numericality: { greater_than: 0 }
  validates :treasury_wallet, length: { is: 44, message: 'is not a valid Solana address' }
  validates :price_sol, numericality: { greater_than: 0 }

  def handle_name
    self.name = "Ticket for #{flight_number}"
  end

  def create_remote_collection
    underdog_response = HTTParty.post("https://mainnet.underdogprotocol.com/v2/projects",
      body: {
        name: "Tickets for #{flight_number}",
        image: collection_image_url,
        description: collection_description,
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
    return unless user.site&.finished?

    HTTParty.post("https://radius.art/wp-json/nftbuilder/v1/traits/#{user.site.remote_id}",
      body: {
        'Flight number': flight_number,
        'Origin': origin,
        'Destination': destination,
        'Departure date': "#{departure_date} #{departure_time}",
        'Arrival date': "#{arrival_date} #{arrival_time}"
      }.to_json,
      basic_auth: Site.wp_authentication,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
