class ChangeSitesImages < ActiveRecord::Migration[7.0]
  def change
    rename_column(:sites, :icon, :icon_remote_id)
    rename_column(:sites, :favicon, :favicon_remote_id)
    change_column(:sites, :icon_remote_id, :integer)
    change_column(:sites, :favicon_remote_id, :integer)
  end
end
