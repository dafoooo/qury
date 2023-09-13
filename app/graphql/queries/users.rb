module Queries
  class Users < BaseQuery
    description "Get all users"
    type [Types::Models::UserType], null: false

    def resolve
      ::User.includes(:projects).all
    end
  end
end
