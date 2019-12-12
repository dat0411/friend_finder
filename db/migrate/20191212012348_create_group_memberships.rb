class CreateGroupMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :group_memberships do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :admin_approval
      t.string :user_accept

      t.timestamps
    end
  end
end
