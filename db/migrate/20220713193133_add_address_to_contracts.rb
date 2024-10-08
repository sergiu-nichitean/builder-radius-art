class AddAddressToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :address, :string
  end
end
