class RemoveDomainFromSites < ActiveRecord::Migration[7.0]
  def change
    remove_column :sites, :domain
  end
end
