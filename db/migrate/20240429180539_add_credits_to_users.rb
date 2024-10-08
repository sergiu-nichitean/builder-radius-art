class AddCreditsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :credits, :integer, null: false, default: 0
  end
end
