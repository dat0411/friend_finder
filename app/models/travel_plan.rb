class TravelPlan < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :start, :presence => true

  validates :status, :presence => true

end
