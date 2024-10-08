class AddFaviconToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :favicon, :string
  end
end
