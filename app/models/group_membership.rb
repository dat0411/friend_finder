class GroupMembership < ApplicationRecord
  # Direct associations

  belongs_to :group,
             :counter_cache => :members_count

  # Indirect associations

  # Validations

end
