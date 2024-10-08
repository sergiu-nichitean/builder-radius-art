class RenameSubscriptionsToPayments < ActiveRecord::Migration[7.0]
  def change
    rename_table :subscriptions, :payments
  end
end
