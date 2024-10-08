class AddCollectionName < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :collection_name, :string
  end
end
