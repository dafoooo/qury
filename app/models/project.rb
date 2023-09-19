class Project < ApplicationRecord
  CREATE_ATTRS = %i[key name description].freeze
  UPDATE_ATTRS = %i[key name description].freeze

  has_many :project_users
  has_many :users, through: :project_users

  validates :key, presence: true, uniqueness: true, length: {within: 2..8}
  validates :name, presence: true, uniqueness: true, length: {within: 2..32}
  validates :description, length: {maximum: 5000}

  scope :authorized_find_for_update, ->(id:, user_id:) do
    joins(:project_users).find_by(
      project_users: {
        user_id: user_id,
        is_owner: true
      },
      projects: {
        id: id
      }
    )
  end
end
