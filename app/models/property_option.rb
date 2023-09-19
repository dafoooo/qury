class PropertyOption < ApplicationRecord
  belongs_to :property
  belongs_to :m_color, class_name: M::Color.name
end
