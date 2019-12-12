require 'rails_helper'

RSpec.describe TravelPlan, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:location) }

    it { should belong_to(:owner) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:end) }

    it { should validate_presence_of(:start) }

    it { should validate_presence_of(:status) }
      
    end
end
