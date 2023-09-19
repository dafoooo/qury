module Queries
  class ProjectUsers < BaseQuery
    description "Get all project_users"
    type [Types::ProjectUserType], null: false

    def resolve
      ::ProjectUser.all
    end
  end
end
