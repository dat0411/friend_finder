require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:location) }

    it { should have_many(:organization_emails) }

    it { should have_many(:group_admins) }

    it { should have_many(:group_memberships) }

    it { should have_many(:travel_plans) }

    it { should have_many(:friends) }

    it { should have_many(:friendships) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }
      
    end
end
