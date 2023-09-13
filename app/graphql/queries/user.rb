module Queries
  class User < BaseQuery
    description "Get all users"
    argument :id, ID, required: true
    type Types::Models::UserType, null: false

    def resolve(id:)
      ::User.find_by id: id
    end
  end
end
