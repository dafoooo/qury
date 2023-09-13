module Types
  module Models
    class ProjectType < Types::BaseObject
      field :id, ID, null: false
      field :name, String
      field :key, String
      field :description, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      field :users, [Types::Models::UserType]

      def users
        object.users
      end
    end
  end
end
