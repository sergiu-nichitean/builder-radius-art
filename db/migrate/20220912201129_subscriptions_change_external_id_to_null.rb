class SubscriptionsChangeExternalIdToNull < ActiveRecord::Migration[7.0]
  def change
    change_column :subscriptions, :external_id, :text, null: true
  end
end
