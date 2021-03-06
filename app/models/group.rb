class Group < ApplicationRecord
  mount_uploader :group_photo, GroupPhotoUploader

  # Direct associations

  has_many   :admins,
             :class_name => "GroupAdmin",
             :dependent => :destroy

  has_many   :members,
             :class_name => "GroupMembership",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :members,
             :source => :user

  # Validations

  validates :group_description, :presence => true

  validates :group_name, :presence => true

end
