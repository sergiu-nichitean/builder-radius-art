class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :keywords
      t.text :description
      t.string :music_url
      t.string :cover_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
