class TopicGroup < ApplicationRecord
  belongs_to :project
  belongs_to :m_color, class_name: M::Color.name

  validates :name, presence: true, uniqueness: true, length: {within: 2..16}
end
