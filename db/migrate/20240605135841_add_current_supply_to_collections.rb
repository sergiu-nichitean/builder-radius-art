class AddCurrentSupplyToCollections < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :current_supply, :integer, default: 0
  end
end
