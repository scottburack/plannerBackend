class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  has_many :groups_user
  has_many :groups, through: :groups_user

end
