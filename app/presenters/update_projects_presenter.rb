class UpdateProjectsPresenter
  attr_reader :project,
              :status

  def initialize(project_id, resources, project_params)
    @project = Project.find_by(id: project_id)
    @resources = resources || []
    @project_params = project_params
    @status = 400
  end

  def body
    if update_successful?
      success
    else
      failure
    end
  end

  def new_resources
    @new_resources ||= @resources.select do |resource|
      if resource['name'] && resource['id'].nil? && resource['status'].nil?
        @project.resources.create(resource.permit(:name, :status)).save
      elsif resource['id'] && (resource['name'] || resource['status'])
        existing_resource = @project.resources.find_by(id: resource[:id])
        existing_resource.update(resource.permit(:name, :status)) if existing_resource
      end
    end
  end

  def resources_valid?
    @resources.length == new_resources.length
  end

  def update_successful?
    @project && resources_valid? && @project.update(@project_params)
  end

  def success
    @status = 200
    {message: "Successfully Updated #{@project.title}!"}
  end

  def failure
    {message: "Invalid Input. Try Again"}
  end

end
