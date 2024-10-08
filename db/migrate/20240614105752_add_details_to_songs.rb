class AddDetailsToSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :error_details, :mediumtext
  end
end
