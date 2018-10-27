class Api::V1::UsersController < ApiController

  def index
    render json: User.all
  end

  def show
    if User.exists?(params[:id])
      render json: User.find(params[:id])
    else
      render status: 404
    end
  end
  
  def create
    user = User.find_by_email_and_token(oauth_params[:email], oauth_params[:token])
    if user
      render json: user
    elsif user = User.create(oauth_params)
      render json: user
    else
      render json: {message: "Incorrect info! Could not find or create"}, status: 400
    end
  end

  private

  def oauth_params
    params.permit(:first_name, :last_name, :email, :token, :district_id, :username)
  end



end
