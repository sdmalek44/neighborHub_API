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
    results = CreateUserPresenter.new(params).authenticate_user
    render json: results[:user], status: results[:status]
  end

  def update
    user = User.find(params[:id])
    user.update(oauth_params)
    if user.save
      render json: user, status: 200
    else
      render json: {message: "Unable to update"}, status: 400
    end
  end

  private

  def all_required?
    oauth_params.keys.count == 6
  end

  def oauth_params
    params.permit(:first_name, :last_name, :email, :district_id, :username, :password)
  end

  def authenticate(existing_user)
    existing_user && existing_user.authenticate(oauth_params[:password])
  end

end
