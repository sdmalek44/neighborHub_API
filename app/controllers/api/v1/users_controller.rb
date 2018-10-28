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
    if user && user.password_digest.nil? && params['password']
      user.password = params['password']
      user.save!
    elsif user.nil? && all_required? && params['password']
      user = User.create(oauth_params)
      user.password = params['password']
      user.save!
    end
    unless user && user.save && user.password_digest.present?
      user = {message: 'Could not create user!'}
      status = 400
    end
    render json: user, status: status
  end

  private

  def all_required?
    oauth_params.keys.count == 5
  end

  def oauth_params
    params.permit(:first_name, :last_name, :email, :district_id, :username)
  end

end
