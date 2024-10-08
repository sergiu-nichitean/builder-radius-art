class AddMore3NftFieldsToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :mint_page_title, :string
    add_column :sites, :mint_page_content, :text
    add_column :sites, :banner_remote_id, :integer
    add_column :sites, :banner_remote_url, :string
    add_column :sites, :free_mint, :boolean
    add_column :sites, :price_sol, :float
    remove_column :sites, :logo
  end
end
