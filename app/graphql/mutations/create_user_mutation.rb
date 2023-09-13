module Mutations
  class CreateUserMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :username, String, required: true

    field :user, Types::Models::UserType, null: true
    field :errors, [Types::ValidationErrorType], null: false

    def resolve(email:, username:)
      user = User.new(email: email, username: username)
      return {user: user, errors: []} if user.save

      {
        user: nil,
        errors: validation_errors(user)
      }
    end
  end
end
