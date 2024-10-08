class AddStatusToSong < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :status, :integer, default: 0
    add_column :songs, :error, :string
  end
end
