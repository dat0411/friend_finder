class AddAdminCountToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :admins_count, :integer
  end
end
