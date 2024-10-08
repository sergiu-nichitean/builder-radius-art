class AddTypeToCollections < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :type, :string
  end
end
