module Queries
  class Project < BaseQuery
    description "Get project by ID"
    argument :id, ID, required: true
    type Types::ProjectType, null: false

    def resolve(id:)
      ::Project.find(id)
    rescue ActiveRecord::RecordNotFound => e
      raise not_found_error(model: e.model, id: e.id)
    end
  end
end
