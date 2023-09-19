# frozen_string_literal: true

module Types
  class TopicGroupType < Types::BaseObject
    field :id, ID, null: false
    field :project_id, Integer, null: false
    field :m_color_id, Integer, null: false
    field :name, String, null: false
    field :description, String

    field :created_at, Types::ISO8601DateTime, null: false
    field :updated_at, Types::ISO8601DateTime, null: false

    field :project, Types::ProjectType, null: false
    field :color, Types::ColorType, null: false

    def project
      ::RecordLoader.for(Project).load(object.project_id)
    end

    def color
      ::RecordLoader.for(Color).load(object.m_color_id)
    end
  end
end
