module Queries
  class User < BaseQuery
    description "Get user by ID"
    argument :id, ID, required: true
    type Types::Models::UserType, null: false

    def resolve(id:)
      ::User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      raise not_found_error(model: e.model, id: e.id)
    end
  end
end
