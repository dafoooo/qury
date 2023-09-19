module Types
  class MutationType < Types::BaseObject
    field :signIn, mutation: Mutations::Auths::SignIn
    field :signOut, mutation: Mutations::Auths::SignOut
    field :createUser, mutation: Mutations::Users::Create
  end
end
