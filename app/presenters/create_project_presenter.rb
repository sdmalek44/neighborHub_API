class CreateProjectPresenter

  def initialize(user_id, project_params, resource_info)
    @user = User.find_by(id: user_id)
    @project_params = project_params
    @resource_info = resource_info
  end

  def create_project
    @project ||= user.projects.create(project_params)
  end

  def create_resources
    @resources ||= resource_info.select {|info| project.resources.create(resource_params(info))}
  end

  def create_project_and_resource
    create_project if user && resources_valid?
    create_resources if project && project.save
    resources && project
  end

  def body
    if create_project_and_resource
      success_message(project.title)
    else
      failure_message
    end
  end

  def status
    if create_project_and_resource
      200
    else
      400
    end
  end

  def success_message(title)
    {message: "Successfully added project '#{title}'!"}
  end

  def failure_message
    {message: "Invalid request. Try again!"}
  end

  private

  attr_reader :user,
              :project_params,
              :resource_info,
              :project,
              :resources

  def resource_params(params)
    params.permit(:name)
  end

  def resources_valid?
    @valid ||= resource_info.length == resource_info.select { |resource| resource[:name] }.length
  end

end
