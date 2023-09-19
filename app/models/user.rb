class User < ApplicationRecord
  has_secure_password

  CREATE_ATTRS = %i[username email password]

  has_many :project_users
  has_many :projects, through: :project_users

  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: {minimum: 3, maximum: 255}
end
