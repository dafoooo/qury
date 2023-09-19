module ExecutionError
  def unauthorized_error
    GraphQL::ExecutionError.new "Unauthorized", extensions: {code: 401}
  end

  def not_found_error(model:, id:)
    GraphQL::ExecutionError.new "Not found", extensions: {code: 404, model: model, id: id}
  end
end
