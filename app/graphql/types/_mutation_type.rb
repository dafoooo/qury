module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::Auths::SignIn
    field :sign_out, mutation: Mutations::Auths::SignOut

    field :create_user, mutation: Mutations::Users::Create

    field :create_project, mutation: Mutations::Projects::Create
    field :update_project, mutation: Mutations::Projects::Update
  end
end
