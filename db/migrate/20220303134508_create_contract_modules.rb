class CreateContractModules < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_modules do |t|
      t.references :contract, null: false, foreign_key: true
      t.string :type
      t.json :settings

      t.timestamps
    end
  end
end
