class AddCoordinatesToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :latitude, :string
    add_column :collections, :longitude, :string
  end
end
