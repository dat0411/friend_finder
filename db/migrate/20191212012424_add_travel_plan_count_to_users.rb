class AddTravelPlanCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :travel_plans_count, :integer
  end
end
