class Property < ApplicationRecord
  enum property_type: {
    text: 0,
    number: 1,
    date: 2,
    checkbox: 3,
    radio: 4,
    select_single: 5,
    select_multiple: 6
  }.freeze

  belongs_to :project
  has_many :property_options
end
