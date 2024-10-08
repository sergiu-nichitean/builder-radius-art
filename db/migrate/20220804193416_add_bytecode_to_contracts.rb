class AddBytecodeToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :bytecode, :text
  end
end
