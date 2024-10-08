class DropPaymentsColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :cancel_at_period_end
    remove_column :payments, :current_period_start
    remove_column :payments, :current_period_end
  end
end
