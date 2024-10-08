class AddPreviewVersionToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :preview_version, :integer
  end
end
