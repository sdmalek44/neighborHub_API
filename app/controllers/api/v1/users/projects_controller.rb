class Api::V1::Users::ProjectsController < ApiController
  def index
    render json: User.find(params[:user_id]).projects, each_serializer: UserProjectSerializer, scope: { user_id: params[:user_id] }
  end

  def create
    project = nil
    user = User.find_by(id: params[:user_id])
    project = user.projects.create(project_params) if user && resources_valid?
    new_resources = resources.select { |resource|
      project.resources.create(resource.permit(:name)).save } if user && project.save
    if resources_valid? && user && project.save
      render json: {message: "Successfully added project '#{project.title}'!"}
    else
      render json: {message: "Invalid request. Try again!"}, status: :bad_request
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
    new_resources = resources.select { |resource| resource.permit(:name).present? }
    new_resources.length == resources.length
  end

end
