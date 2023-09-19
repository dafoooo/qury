module Mutations
  class Projects::Create < Mutations::BaseMutation
    graphql_name "CreateProjects"

    argument :attributes, Types::Inputs::CreateProjectInput, required: true

    field :project, Types::ProjectType, null: true
    field :errors, [Types::ValidationErrorType], null: false

    def resolve(attributes:)
      project = ::Project.new(project_params(attributes))
      project.save!

      {project: project, errors: []}
    rescue ActiveRecord::RecordInvalid
      {project: nil, errors: validation_errors(project)}
    rescue
      raise unprocessable_entity_error
    end

    private

    def project_params(attributes)
      attributes.to_h.slice(*::Project::CREATE_ATTRS)
    end
  end
end
