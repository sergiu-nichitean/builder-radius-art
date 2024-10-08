class AddSettingsToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :title, :string
    add_column :sites, :icon, :string
  end
end
