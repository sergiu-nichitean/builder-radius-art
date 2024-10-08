class RemoveCollectionImageFromCollections < ActiveRecord::Migration[7.0]
  def change
    remove_column :collections, :collection_image
  end
end
