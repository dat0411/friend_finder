class CreateTravelPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_plans do |t|
      t.string :plan_description
      t.date :start
      t.date :end
      t.integer :owner_id
      t.string :status
      t.integer :location_id

      t.timestamps
    end
  end
end
