class AddMemberCountToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :members_count, :integer
  end
end
