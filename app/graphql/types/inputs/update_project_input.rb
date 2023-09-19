module Types
  module Inputs
    class UpdateProjectInput < BaseInputObject
      graphql_name "UpdateProjectInput"

      argument :key, String, required: true
      argument :name, String, required: true
      argument :description, String, required: true
    end
  end
end
