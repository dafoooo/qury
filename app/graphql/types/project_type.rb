module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :key, String
    field :description, String

    field :created_at, Types::ISO8601DateTime, null: false
    field :updated_at, Types::ISO8601DateTime, null: false

    field :users, [Types::UserType]
    field :topic_groups, [Types::TopicGroupType]

    def users
      ::AssociationLoader.for(object.class, :users).load(object)
    end

    def properties
      ::AssociationLoader.for(object.class, :properties).load(object)
    end

    def categories
      ::AssociationLoader.for(object.class, :categories).load(object)
    end

    def topic_groups
      ::AssociationLoader.for(object.class, :topic_groups).load(object)
    end
  end
end
