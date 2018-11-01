class Api::V1::UsersController < ApiController

  def index
    render json: User.all
  end

  def show
    results = ShowUserPresenter.new(params).find_user
    render json: results[:user], status: results[:status]
  end

  def create
    results = CreateUserPresenter.new(params).authenticate_user
    render json: results[:user], status: results[:status]
  end

  def update
    results = UpdateUserPresenter.new(params).validate_action
    render json: results[:user], status: results[:status]
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
