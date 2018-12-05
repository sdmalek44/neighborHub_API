class UpdateProjectsPresenter
  attr_reader :project,
              :body,
              :status

  def initialize(project_id, resources, project_params)
    @project = Project.find_by(id: project_id)
    @resources = resources || []
    @project_params = project_params
  end

  def evaluate
    if update_successful?
      success
    else
      failure
    end
    self
  end

  def new_resources
    @new_resources ||= @resources.select do |resource|
      if resource['name'] && resource['id'].nil? && resource['status'].nil?
        @project.resources.create(resource.permit(:name, :status))
      elsif resource['id'] && (resource['name'] || resource['status'])
        @project.resources.find(resource[:id]).update(resource.permit(:name, :status))
      end
    end
  end

  def resources_valid?
    @resources.length == new_resources.length
  end

  def update_successful?
    true if @project && resources_valid? && @project.update(@project_params)
  end

  def success
    @body = {message: "Successfully Updated #{@project.title}!"}
    @status = 200
  end

  def failure
    @body = {message: "Invalid Input. Try Again"}
    @status = 400
  end

end
