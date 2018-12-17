class CreateGoogleUsersPresenter
  attr_reader :status

  def initialize(params)
    @status = 400
    @params = params
  end

  def user
    @user ||= User.find_by_email(oauth_params[:email])
  end

  def body
    if !user
      create_and_return_user
    else
      authenticate_and_return_user
    end
  end

  def create_and_return_user
    @user = User.create(oauth_params)
    if user.save
      @status = 200
      user
    else
      incorrect_params
    end
  end

  def authenticate_and_return_user
    if user && user.authenticate(oauth_params[:password])
      @status = 200
      user
    else
      incorrect_login
    end
  end

  def incorrect_login
    {message: 'Incorrect login method!'}
  end

  def incorrect_params
    {message: 'Incorrect parameters given!'}
  end

  private

  def oauth_params
    @params.permit(:first_name, :last_name, :email, :password, :district_id, :username)
  end

end
