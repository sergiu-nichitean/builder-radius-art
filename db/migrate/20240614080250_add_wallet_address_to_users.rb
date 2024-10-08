class AddWalletAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :wallet_address, :string
    add_index :users, :wallet_address, unique: true
  end
end
