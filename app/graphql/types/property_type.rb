# frozen_string_literal: true

module Types
  class PropertyType < Types::BaseObject
    field :id, ID, null: false
    field :project_id, Integer, null: false
    field :name, String, null: false
    field :description, String
    field :property_type, Integer, null: false
    field :required, Boolean

    field :created_at, Types::ISO8601DateTime, null: false
    field :updated_at, Types::ISO8601DateTime, null: false

    ield :property_options, Types::PropertyOptionType, null: false
    field :project, Types::ProjectType, null: false
    field :color, Types::ColorType, null: false

    def property_options
      ::AssociationLoader.for(object.class, :property_options).load(object)
    end

    def project
      ::RecordLoader.for(Project).load(object.project_id)
    end
  end
end
