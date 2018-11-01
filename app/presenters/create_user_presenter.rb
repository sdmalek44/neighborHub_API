class CreateUserPresenter

  def initialize(params)
    @params = params
  end

  def validate_creation
    status = 200
    user = User.find_by_email(oauth_params[:email])
    if !user && !(all_required?) && oauth_params[:username]
      existing_user = User.find_by_username(oauth_params[:username])
      user = existing_user if authenticate(existing_user)
    end
    if user.nil? && all_required?
      user = User.create(oauth_params)
    elsif user && !(user.authenticate(oauth_params[:password]))
      user = {message: 'Incorrect login!'}
      status = 400
    elsif !user && !(all_required?)
      user = {message: 'Incorrect parameters given!'}
      status = 400
    end
    {user: user, status: status}
  end

  private

  def all_required?
    oauth_params.keys.count == 6
  end

  def oauth_params
    @params.permit(:first_name, :last_name, :email, :district_id, :username, :password)
  end

  def authenticate(existing_user)
    existing_user && existing_user.authenticate(oauth_params[:password])
  end
end
