module Queries
  class Projects < BaseQuery
    description "Get all projects"
    type [Types::ProjectType], null: false

    def resolve
      ::Project.all
    end
  end
end
