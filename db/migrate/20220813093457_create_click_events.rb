class CreateClickEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :click_events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :click_data

      t.timestamps
    end
  end
end
