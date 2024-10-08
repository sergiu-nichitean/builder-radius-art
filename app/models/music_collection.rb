class MusicCollection < Collection
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
          { type: :file_field, name: :animation, label: 'Music file' },
          { type: :file_field, name: :image, label: 'NFT image' }
        ]
      },
      {
        name: 'Supply',
        fields: [
          { type: :check_box, name: :open_edition, label: 'Open edition?', html_options: { onclick: "$('#music_collection_max_supply').prop('disabled', $(this).is(':checked'));if($(this).is(':checked')){$('#music_collection_max_supply').attr('type', 'text');$('#music_collection_max_supply').val('Unlimited');}else{$('#music_collection_max_supply').attr('type', 'number');$('#music_collection_max_supply').val('');}" } },
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

  def page_title
    'Create Your Music NFT'
  end
end
