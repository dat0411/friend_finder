class AddGroupMembershipCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :group_memberships_count, :integer
  end
end
