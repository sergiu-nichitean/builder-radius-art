class AddAddressToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :address_line_1, :string
    add_column :subscriptions, :address_line_2, :string
    add_column :subscriptions, :city, :string
    add_column :subscriptions, :state, :string
    add_column :subscriptions, :postal_code, :string
    add_column :subscriptions, :country, :string
  end
end
