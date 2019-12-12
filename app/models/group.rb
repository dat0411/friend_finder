class Group < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :group_description, :presence => true

  validates :group_name, :presence => true

end
