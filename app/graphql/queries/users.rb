module Queries
  class Users < BaseQuery
    description "Get all users"
    type [Types::UserType], null: false

    def resolve
      ::User.all
    end
  end
end
