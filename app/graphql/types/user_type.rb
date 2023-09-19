module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :username, String

    field :created_at, Types::ISO8601DateTime, null: false
    field :updated_at, Types::ISO8601DateTime, null: false

    field :projects, [Types::ProjectType]

    def projects
      ::AssociationLoader.for(object.class, :projects).load(object)
    end
  end
end
