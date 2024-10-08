class AddRemoteUrlToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :logo_remote_url, :string
    add_column :sites, :icon_remote_url, :string
  end
end
