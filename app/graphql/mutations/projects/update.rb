module Mutations
  class Projects::Update < Mutations::BaseMutation
    graphql_name "UpdateProjects"

    argument :id, ID, required: true
    argument :attributes, Types::Inputs::UpdateProjectInput, required: true

    field :project, Types::ProjectType, null: true
    field :errors, [Types::ValidationErrorType], null: false

    def resolve(id:, attributes:)
      project = ::Project.authorized_find_for_update(id: id, user_id: context[:current_user].id)
      raise not_found_error unless project

      project.update!(
        key: attributes[:key],
        name: attributes[:name],
        description: attributes[:description]
      )

      {project: project, errors: []}
    rescue ActiveRecord::RecordInvalid
      {project: nil, errors: validation_errors(project)}
    rescue
      raise unprocessable_entity_error
    end

    private

    def project_params(attributes)
      attributes.to_h.slice(*::Project::UPDATE_ATTRS)
    end
  end
end
