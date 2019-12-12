class AddOrganizationEmailCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :organization_emails_count, :integer
  end
end
