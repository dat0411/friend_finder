class Group < ApplicationRecord
  # Direct associations

  has_many   :admins,
             :class_name => "GroupAdmin",
             :dependent => :destroy

  has_many   :members,
             :class_name => "GroupMembership",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :group_description, :presence => true

  validates :group_name, :presence => true

end
