class ChangeSongError < ActiveRecord::Migration[7.0]
  def change
    change_column :songs, :error, :text
  end
end
