# frozen_string_literal: true

module Types
  class ColorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :key, String

    field :created_at, Types::ISO8601DateTime, null: false
    field :updated_at, Types::ISO8601DateTime, null: false
  end
end
