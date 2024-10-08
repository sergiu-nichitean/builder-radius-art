class AddMoresettingsToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :subdomain, :string
    add_column :sites, :logo, :string
    add_column :sites, :twitter, :string
    add_column :sites, :discord, :string
    add_column :sites, :instagram, :string
  end
end
