class Api::V1::ProjectsController < ApiController

  def index
    render json: Project.all
  end

  def update
    @presenter = UpdateProjectsPresenter.new(params[:id], params[:project][:resources], project_params).evaluate
    render json: @presenter.body, status: @presenter.status
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end
  
end
