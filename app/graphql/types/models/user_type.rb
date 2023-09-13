module Types
  module Models
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :email, String
      field :username, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      field :projects, [Types::Models::ProjectType]

      def projects
        object.projects
      end
    end
  end
end
