class Location < ApplicationRecord
  # Direct associations

  has_many   :travel_plans,
             :dependent => :destroy

  has_many   :users,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
