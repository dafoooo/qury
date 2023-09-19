module Types
  class ProjectUserType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :project_id, Integer, null: false
    field :is_owner, Boolean

    field :created_at, Types::ISO8601DateTime, null: false
    field :updated_at, Types::ISO8601DateTime, null: false

    field :user, Types::UserType
    field :project, Types::ProjectType

    def user
      ::RecordLoader.for(User).load(object.user_id)
    end

    def project
      ::RecordLoader.for(Project).load(object.project_id)
    end
  end
end
