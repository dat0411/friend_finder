require 'rails_helper'

RSpec.describe GroupMembership, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:group) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
