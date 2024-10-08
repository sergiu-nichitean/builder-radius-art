class FreeMintCollection < Collection
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
          { type: :file_field, name: :animation, label: 'Video file (optional)' }
        ]
      },
      {
        name: 'Supply',
        fields: [
          { type: :check_box, name: :open_edition, label: 'Open edition?', html_options: { onclick: "$('#free_mint_collection_max_supply').prop('disabled', $(this).is(':checked'));if($(this).is(':checked')){$('#free_mint_collection_max_supply').attr('type', 'text');$('#free_mint_collection_max_supply').val('Unlimited');}else{$('#free_mint_collection_max_supply').attr('type', 'number');$('#free_mint_collection_max_supply').val('');}" } },
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
        name: 'Email Claim',
        fields: [
          { type: :check_box, name: :email_claim, label: 'Claim with email?' }
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
    'Drop Free NFTs'
  end
end
