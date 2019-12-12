class GroupAdmin < ApplicationRecord
  # Direct associations

  belongs_to :group,
             :counter_cache => :admins_count

  # Indirect associations

  # Validations

end
