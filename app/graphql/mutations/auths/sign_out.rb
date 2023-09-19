module Mutations
  module Auths
    class SignOut < BaseMutation
      graphql_name "SignOut"
      field :message, String, null: true

      def resolve
        token = context[:cookies].signed[Settings.jwt.cookie.name]
        ::Qury::Auth.revoke(token)
        context[:cookies].delete(Settings.jwt.cookie.name)

        {
          message: "Goodbye!"
        }
      end
    end
  end
end
