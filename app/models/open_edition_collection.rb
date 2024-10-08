class OpenEditionCollection < Collection
  def nft_field_categories
    [
      {
        name: 'NFT Details',
        fields: [
          { type: :text_field, name: :name, label: 'NFT name' },
          { type: :text_area, name: :description, label: 'NFT description', html_options: { rows: '5' } },
          { type: :file_field, name: :image, label: 'NFT image' },
          { type: :text_field, name: :max_supply, label: 'Supply', html_options: { disabled: true, placeholder: 'Unlimited' } }
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
    'Create Your Open Edition NFT'
  end
end
