class AddIdsToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :front_page_id, :integer
    add_column :sites, :about_page_id, :integer
    add_column :sites, :contact_page_id, :integer
  end
end
