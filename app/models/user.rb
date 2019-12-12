class User < ApplicationRecord
  # Direct associations

  belongs_to :location

  has_many   :organization_emails,
             :dependent => :destroy

  has_many   :group_admins,
             :dependent => :destroy

  has_many   :group_memberships,
             :dependent => :destroy

  has_many   :travel_plans,
             :foreign_key => "owner_id",
             :dependent => :destroy

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
