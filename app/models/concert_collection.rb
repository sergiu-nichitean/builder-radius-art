class ConcertCollection < Collection
  def nft_field_categories
    [
      {
        name: 'Collection Details',
        fields: [
          { type: :text_field, name: :collection_name, label: 'Collection name' },
          { type: :text_area, name: :collection_description, label: 'Collection Description', html_options: { rows: '5' } }
        ]
      },
      {
        name: 'NFT Details',
        fields: [
          { type: :text_field, name: :name, label: 'NFT name' },
          { type: :text_area, name: :description, label: 'NFT description', html_options: { rows: '5' } },
          { type: :file_field, name: :image, label: 'NFT image' }
        ]
      },
      {
        name: 'Supply',
        fields: [
          { type: :check_box, name: :open_edition, label: 'Open edition?', html_options: { onclick: "$('#concert_collection_max_supply').prop('disabled', $(this).is(':checked'));if($(this).is(':checked')){$('#concert_collection_max_supply').attr('type', 'text');$('#concert_collection_max_supply').val('Unlimited');}else{$('#concert_collection_max_supply').attr('type', 'number');$('#concert_collection_max_supply').val('');}" } },
          { type: :number_field, name: :max_supply, label: 'Supply', html_options: { disabled: open_edition?, placeholder: open_edition? ? 'Unlimited' : '' } }
        ]
      },
      {
        name: 'Royalties',
        fields: [
          { type: :text_field, name: :royalties_percent, label: 'Royalties percent' },
          { type: :text_field, name: :royalties_wallet, label: 'Royalties wallet' }
        ]
      }
    ]
  end

  def website_field_categories
    [
      {
        name: 'Earnings',
        fields: [
          { type: :text_field, name: :price_sol, label: 'Price (SOL)' },
          { type: :text_field, name: :treasury_wallet, label: 'Treasury wallet' }
        ]
      },
      {
        name: 'Geo-fencing',
        fields: [
          { type: :text_field, name: :latitude, label: 'Latitude' },
          { type: :text_field, name: :longitude, label: 'Longitude' }
        ]
      },
      {
        name: 'Time locking',
        fields: [
          { type: :time, name: :start, label: 'Start' },
          { type: :time, name: :end, label: 'End' }
        ]
      }
    ]
  end

  def page_title
    'Drop an NFT at your concert'
  end
end
