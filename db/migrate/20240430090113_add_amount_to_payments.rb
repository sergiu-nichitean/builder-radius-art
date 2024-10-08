class AddAmountToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :amount, :float
    add_column :payments, :credits, :integer
  end
end
