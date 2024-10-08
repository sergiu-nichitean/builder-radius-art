class GenericNftCollection < Collection
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
          { type: :file_field, name: :image, label: 'NFT image' },
          { type: :file_field, name: :animation, label: 'Animation file (audio, video, GIF, glTF 3D model) - optional' }
        ]
      },
      {
        name: 'Supply',
        fields: [
          { type: :check_box, name: :open_edition, label: 'Open edition?', html_options: { onclick: "$('#generic_nft_collection_max_supply').prop('disabled', $(this).is(':checked'));if($(this).is(':checked')){$('#generic_nft_collection_max_supply').attr('type', 'text');$('#generic_nft_collection_max_supply').val('Unlimited');}else{$('#generic_nft_collection_max_supply').attr('type', 'number');$('#generic_nft_collection_max_supply').val('');}" } },
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
          { type: :check_box, name: :free_mint, label: 'Free mint?', html_options: { onclick: "$('#site_price_sol, #site_treasury_wallet').prop('disabled', $(this).is(':checked'));$('#site_email_claim').prop('disabled', !$(this).is(':checked'));if ($(this).is(':checked')){  $('#site_price_sol').val('Free');  $('#site_treasury_wallet').val('N/A');} else {  $('#site_price_sol').val(''); $('#site_email_claim').prop('checked', false); $('#site_treasury_wallet').val('');}" } },
          { type: :check_box, name: :email_claim, label: 'Claim with email?', html_options: { disabled: !free_mint? } },
          { type: :text_field, name: :price_sol, label: 'Price (SOL)', html_options: { disabled: free_mint? } },
          { type: :text_field, name: :treasury_wallet, label: 'Treasury wallet', html_options: { disabled: free_mint? } }
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
    'Create Your Custom NFTs'
  end
end
