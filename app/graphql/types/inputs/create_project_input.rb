module Types
  module Inputs
    class CreateProjectInput < BaseInputObject
      graphql_name "CreateProjectInput"

      argument :key, String, required: true
      argument :name, String, required: true
      argument :description, String, required: true
    end
  end
end
