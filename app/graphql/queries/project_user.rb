module Queries
  class ProjectUser < BaseQuery
    description "Get project_user by ID"
    argument :id, ID, required: true
    type Types::ProjectUserType, null: false

    def resolve(id:)
      ::ProjectUser.find(id)
    rescue ActiveRecord::RecordNotFound => e
      raise not_found_error(model: e.model, id: e.id)
    end
  end
end
