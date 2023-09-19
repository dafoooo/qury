# frozen_string_literal: true

module Types
  class PropertyOptionType < Types::BaseObject
    field :id, ID, null: false
    field :property_id, Integer, null: false
    field :m_color_id, Integer, null: false
    field :value, String
    field :default, Boolean

    field :created_at, Types::ISO8601DateTime, null: false
    field :updated_at, Types::ISO8601DateTime, null: false

    field :property, Types::PropertyType

    def property
      ::RecordLoader.for(Property).load(object.property_id)
    end

    def color
      ::RecordLoader.for(Color).load(object.m_color_id)
    end
  end
end
