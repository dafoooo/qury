module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include ExecutionError

    def ready?(**args)
      token = context[:cookies].signed[Settings.jwt.cookie.name]
      raise unauthorized_error if ::Qury::Auth.revoked?(token) || context[:current_user].blank?

      true
    end

    def validation_errors(obj)
      obj.errors.map do |error|
        {
          attribute: error.attribute,
          type: error.type
        }
      end
    end
  end
end
