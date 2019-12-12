class TravelPlan < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :end, :presence => true

  validates :start, :presence => true

  validates :status, :presence => true

end
