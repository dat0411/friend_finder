class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.text :group_description
      t.string :group_photo

      t.timestamps
    end
  end
end
