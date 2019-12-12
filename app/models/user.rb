class User < ApplicationRecord
  # Direct associations

  has_many   :friends,
             :class_name => "Friendship",
             :foreign_key => "receiver_id",
             :dependent => :destroy

  has_many   :friendships,
             :foreign_key => "sender_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
