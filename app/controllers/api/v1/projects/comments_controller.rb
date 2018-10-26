class Api::V1::Projects::CommentsController < ApiController
  def index
    render json: Project.find(params[:project_id]).user_comments, each_serializer: UserCommentsSerializer
  end
end
