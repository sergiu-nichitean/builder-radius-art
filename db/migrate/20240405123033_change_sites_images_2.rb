class ChangeSitesImages2 < ActiveRecord::Migration[7.0]
  def change
    rename_column(:sites, :icon_remote_id, :logo_remote_id)
    rename_column(:sites, :favicon_remote_id, :icon_remote_id)
  end
end
