module Types
  class MutationType < Types::BaseObject
    field :createUser, mutation: Mutations::CreateUserMutation
  end
end
