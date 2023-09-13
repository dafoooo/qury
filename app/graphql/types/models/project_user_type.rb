module Types
  module Models
    class ProjectUserType < Types::BaseObject
      field :id, ID, null: false
      field :user_id, Integer, null: false
      field :project_id, Integer, null: false
      field :is_owner, Boolean
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      field :user, Types::UserType, null: false
      field :project, Types::ProjectType, null: false
    end
  end
end
