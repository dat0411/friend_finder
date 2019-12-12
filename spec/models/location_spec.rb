require 'rails_helper'

RSpec.describe Location, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:travel_plans) }

    it { should have_many(:users) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
