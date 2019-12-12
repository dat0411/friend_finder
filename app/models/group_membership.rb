class GroupMembership < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :group,
             :counter_cache => :members_count

  # Indirect associations

  # Validations

end
