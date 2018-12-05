class CreateUserPresenter
  attr_reader :user,
              :status
  def initialize(params)
    @params = params
  end

  def validate_creation
    @status = 200
    @user = User.find_by_email(oauth_params[:email]) || User.find_by_username(oauth_params[:username])
    !@user && all_required? ? @user = User.create(oauth_params) : check_for_error
    self
  end

  def check_for_error
    if !@user && !(all_required?)
      incorrect_params
    elsif @user && !@user.authenticate(oauth_params[:password])
      incorrect_login
    end
  end

  def incorrect_params
    @user = {message: 'Incorrect parameters given!'}
    @status = 400
  end

  def incorrect_login
    @user = {message: 'Incorrect login!'}
    @status = 400
  end

  private

  def all_required?
    oauth_params.keys.count == 6
  end

  def oauth_params
    @params.permit(:first_name, :last_name, :email, :district_id, :username, :password)
  end

end
