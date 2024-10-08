class AddMore2NftFieldsToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :treasury_wallet, :string
    add_column :sites, :mint_button_text, :string
    add_column :sites, :collection_remote_id, :integer
  end
end
