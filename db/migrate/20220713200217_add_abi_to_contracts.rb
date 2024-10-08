class AddAbiToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :abi, :string
  end
end
