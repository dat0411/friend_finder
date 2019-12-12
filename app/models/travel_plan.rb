class TravelPlan < ApplicationRecord
  # Direct associations

  belongs_to :location

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :end, :presence => true

  validates :start, :presence => true

  validates :status, :presence => true

end
