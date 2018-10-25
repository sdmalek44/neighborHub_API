class Api::V1::ProjectsController < ApiController

  def index
    render json: Project.all
  end

  def update
    project = Project.find(params[:id])
    if resources_valid? && project && project.update(project_params)
      resources.each { |resource| project.resources.find(resource[:id]).update(resource.permit(:name, :status)) }
      render json: {message: "Successfully Updated #{project.title}!"}
    else
      render json: {message: "Invalid Input. Try Again"} , status: 400
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end

  def resources
    params[:project][:resources]
  end

  def resources_valid?
    new_resources = resources.select { |resource| resource['id'] && resource['name'] && resource['status'] }
    new_resources.length == resources.length
  end
end
