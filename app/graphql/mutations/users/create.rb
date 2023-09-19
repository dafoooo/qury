module Mutations
  class Users::Create < Mutations::BaseMutation
    graphql_name "CreateUser"

    argument :attributes, Types::Inputs::CreateUserInput, required: true

    field :user, Types::UserType, null: true
    field :errors, [Types::ValidationErrorType], null: false

    def resolve(attributes:)
      user = ::User.new(user_params(attributes))
      user.save!

      {user: user, errors: []}
    rescue ActiveRecord::RecordInvalid
      {user: nil, errors: validation_errors(user)}
    rescue
      raise unprocessable_entity_error
    end

    private

    def user_params(attributes)
      attributes.to_h.slice(*::User::CREATE_ATTRS)
    end
  end
end
