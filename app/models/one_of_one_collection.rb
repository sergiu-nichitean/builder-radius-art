class OneOfOneCollection < Collection
  def nft_field_categories
    [
      {
        name: 'NFT Details',
        fields: [
          { type: :text_field, name: :name, label: 'NFT name' },
          { type: :text_area, name: :description, label: 'NFT description', html_options: { rows: '5' } },
          { type: :file_field, name: :image, label: 'NFT image' },
          { type: :number_field, name: :max_supply, label: 'Supply', html_options: { disabled: true } }
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
    'Create Your 1-of-1 NFT'
  end

  def max_supply
    1
  end
end
