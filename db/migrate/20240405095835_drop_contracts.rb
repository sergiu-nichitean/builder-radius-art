class DropContracts < ActiveRecord::Migration[7.0]
  def change
    drop_table :contract_modules
    drop_table :contracts
  end
end
