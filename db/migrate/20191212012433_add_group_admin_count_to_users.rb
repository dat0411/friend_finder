class AddGroupAdminCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :group_admins_count, :integer
  end
end
