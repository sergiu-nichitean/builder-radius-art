class ChangeAbiToText < ActiveRecord::Migration[7.0]
  def change
    change_column :contracts, :abi, :text
  end
end
