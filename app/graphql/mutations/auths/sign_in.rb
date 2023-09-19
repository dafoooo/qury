module Mutations
  module Auths
    class SignIn < BaseMutation
      graphql_name "SignIn"
      argument :credentials, Types::Inputs::CredentialsInput, required: false
      field :user, Types::Models::UserType, null: true

      def ready?(**args)
        true
      end

      def resolve(credentials: nil)
        return unless credentials

        user = User.find_by email: credentials[:email]

        raise unauthorized_error unless user
        raise unauthorized_error unless user.authenticate(credentials[:password])

        context[:cookies].signed[Settings.jwt.cookie.name] = {
          value: Qury::Auth.encode(payload(user)),
          httponly: Settings.jwt.cookie.httponly,
          secure: Settings.jwt.cookie.secure
        }

        {
          user: user
        }
      end

      private

      def payload user
        {
          id: user.id,
          email: user.email
        }
      end
    end
  end
end
