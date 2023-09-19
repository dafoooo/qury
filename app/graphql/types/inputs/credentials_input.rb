module Types
  module Inputs
    class CredentialsInput < BaseInputObject
      graphql_name "CredentialsInput"

      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
