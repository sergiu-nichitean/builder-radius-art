class AddCompanyToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :company_name, :string
    add_column :subscriptions, :vat_id, :string
  end
end
