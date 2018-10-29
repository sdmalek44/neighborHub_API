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
    status = 200
    user = User.find_by_email(oauth_params[:email])
    if user.nil? && all_required?
      user = User.create(oauth_params)
    elsif user && !(user.authenticate(oauth_params[:password]))
      user = {message: 'Incorrect login method!'}
      status = 400
    elsif !(all_required?)
      user = {message: 'Incorrect parameters given!'}
      status = 400
    end
    render json: user, status: status
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :district_id, :username, :password)

  end

end
