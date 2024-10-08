class AddDomainToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :domain, :string
  end
end
