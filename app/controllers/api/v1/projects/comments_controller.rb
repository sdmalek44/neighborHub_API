class Api::V1::Projects::CommentsController < ApiController
  def index
    if project = Project.find_by(id: params[:project_id])
      render json: project.user_comments, each_serializer: UserCommentsSerializer
    else
      render json: {message: 'Project Not Found!'}, status: 404
    end
  end
end
