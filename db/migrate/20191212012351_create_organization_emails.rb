class CreateOrganizationEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_emails do |t|
      t.integer :user_id
      t.string :status
      t.string :organization_email

      t.timestamps
    end
  end
end
