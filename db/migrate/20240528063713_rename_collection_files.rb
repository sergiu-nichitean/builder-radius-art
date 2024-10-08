class RenameCollectionFiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :collections, :animation_url
    remove_column :collections, :image_url
  end
end
