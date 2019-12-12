class AddFriendCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :friends_count, :integer
  end
end
