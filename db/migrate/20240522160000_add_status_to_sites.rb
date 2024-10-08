class AddStatusToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :status, :integer, default: 0
    add_column :sites, :error, :text
  end
end
