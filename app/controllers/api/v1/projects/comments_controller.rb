class Api::V1::Projects::CommentsController < ApiController
  def index
    if project = Project.find_by(id: params[:project_id])
      render json: project.user_comments, each_serializer: UserCommentsSerializer
    else
      render json: {message: 'Project Not Found!'}, status: 404
    end
  end

  def create
    project = Project.find(params[:project_id])
    if project
      comment = project.comments.create(comment_params)
      if comment.save
        render json: comment
      else
        render json: {message: 'Unable to create comment'}, status: 400
      end
    else
      render json: {message: 'Project Not Found!'}, status: 404
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :project_id, :content)
  end

end
