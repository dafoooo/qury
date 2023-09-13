module ExecutionError
  def not_found_error
  end

  def unauthenticated_error
    GraphQL::ExecutionError.new "Not authenticated"
  end

  # def validation_error obj
  #   obj.errors.map do |error|
  #     {
  #       attribute: error.attribute,
  #       error: error.type
  #     }
  #   end

  # GraphQL::ExecutionError.new "Validation error", extensions: {errors}
  # end
end
