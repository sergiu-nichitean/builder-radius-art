class AddPlanToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :plan, :string
  end
end
