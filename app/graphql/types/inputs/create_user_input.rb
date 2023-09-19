module Types
  module Inputs
    class CreateUserInput < BaseInputObject
      graphql_name "CreateUserInput"

      argument :email, String, required: true
      argument :username, String, required: true
      argument :password, String, required: true
    end
  end
end
