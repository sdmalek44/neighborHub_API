class Api::V1::Users::ProjectsController < ApiController
  def index
    render json: User.find(params[:user_id]).projects, each_serializer: UserProjectSerializer, scope: { user_id: params[:user_id] }
  end
end
