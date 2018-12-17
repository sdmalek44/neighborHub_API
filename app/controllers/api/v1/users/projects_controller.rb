class Api::V1::Users::ProjectsController < ApiController
  def index
    render json: User.find(params[:user_id]).projects, each_serializer: UserProjectSerializer, scope: { user_id: params[:user_id] }
  end

  def create
    result = CreateProjectPresenter.new(params[:user_id], project_params, resources)
    render json: result.body, status: result.status
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end

  def resources
    return [] unless params[:project][:resources]
    params[:project][:resources]
  end

end
