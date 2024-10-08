class AddTypeToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :type, :string
  end
end
