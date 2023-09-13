module Types
  class ValidationErrorType < Types::BaseObject
    field :attribute, String, null: false
    field :type, String, null: false
  end
end
