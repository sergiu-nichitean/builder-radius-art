class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.text :external_id, null: false
      t.belongs_to :user, foreign_key: true, null: false, index: true
      t.text :status, null: false
      t.boolean :cancel_at_period_end, null: false, default: false
      t.datetime :current_period_start, null: false
      t.datetime :current_period_end, null: false
      t.text :stripe_customer_id

      t.timestamps null: false
    end
  end
end
