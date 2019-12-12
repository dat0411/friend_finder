require 'rails_helper'

RSpec.describe Group, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:admins) }

    it { should have_many(:members) }

    end

    describe "InDirect Associations" do

    it { should have_many(:users) }

    end

    describe "Validations" do

    it { should validate_presence_of(:group_description) }

    it { should validate_presence_of(:group_name) }
      
    end
end
