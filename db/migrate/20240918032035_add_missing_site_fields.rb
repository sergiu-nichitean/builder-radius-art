class AddMissingSiteFields < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :email_claim, :boolean
    add_column :sites, :latitude, :string
    add_column :sites, :longitude, :string
    add_column :sites, :start_time, :string
    add_column :sites, :start_date, :string
    add_column :sites, :end_time, :string
    add_column :sites, :end_date, :string
  end
end
