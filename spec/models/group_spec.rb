require 'rails_helper'

RSpec.describe Group, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:group_description) }

    it { should validate_presence_of(:group_name) }
      
    end
end
