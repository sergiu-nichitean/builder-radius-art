class AddNftFieldsToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :nft_image_remote_id, :integer
    add_column :sites, :nft_image_remote_url, :string
    add_column :sites, :nft_animation_remote_id, :integer
    add_column :sites, :nft_animation_remote_url, :string
    add_column :sites, :nft_name, :string
    add_column :sites, :nft_description, :string
    add_column :sites, :max_supply, :string
    add_column :sites, :open_edition, :boolean
  end
end
