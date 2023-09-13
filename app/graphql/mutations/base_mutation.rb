module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include ExecutionError

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
