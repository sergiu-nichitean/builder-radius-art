class AddFlightToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :flight_number, :string
    add_column :collections, :origin, :string
    add_column :collections, :destination, :string
    add_column :collections, :departure_date, :string
    add_column :collections, :departure_time, :string
    add_column :collections, :arrival_date, :string
    add_column :collections, :arrival_time, :string
    add_column :collections, :royalties_percent, :string
    add_column :collections, :royalties_wallet, :string
    add_column :collections, :collection_description, :text
    add_column :collections, :collection_image, :string
  end
end
