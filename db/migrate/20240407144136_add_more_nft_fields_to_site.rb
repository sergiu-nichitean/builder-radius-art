class AddMoreNftFieldsToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :symbol, :string
    add_column :sites, :external_url, :string
  end
end
