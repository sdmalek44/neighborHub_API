class Api::V1::ProjectsController < ApiController

  def index
    render json: Project.all
  end

  def update
    results = UpdateProjectsPresenter.new(params[:id], params[:project][:resources], project_params).evaluate
    render json: results.body, status: results.status
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end

end
