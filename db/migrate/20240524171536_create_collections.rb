class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :song, null: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :image_url
      t.string :animation_url
      t.string :max_supply
      t.boolean :open_edition
      t.string :treasury_wallet
      t.integer :remote_id
      t.boolean :free_mint
      t.float :price_sol

      t.timestamps
    end
  end
end
