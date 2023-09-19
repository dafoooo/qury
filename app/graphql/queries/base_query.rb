module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    include ExecutionError

    def ready?(**args)
      token = context[:cookies].signed[Settings.jwt.cookie.name]
      raise unauthorized_error if ::Qury::Auth.revoked?(token) || context[:current_user].blank?

      true
    end
  end
end
