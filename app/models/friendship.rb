class Friendship < ApplicationRecord
  # Direct associations

  belongs_to :receiver,
             :class_name => "User",
             :counter_cache => :friends_count

  belongs_to :sender,
             :class_name => "User"

  # Indirect associations

  # Validations

end
