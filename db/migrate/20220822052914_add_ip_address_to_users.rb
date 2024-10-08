class AddIpAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ip_address, :string
    add_column :users, :user_agent, :string
  end
end
