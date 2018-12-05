class CreateGoogleUsersPresenter
  attr_reader :user,
              :status

  def initialize(params)
    @status = 200
    @params = params
  end

  def validate_creation
    @user = User.find_by_email(oauth_params[:email])
    !@user && all_required? ? @user = User.create(oauth_params) : check_for_error
    self
  end

  def check_for_error
    if @user && !@user.authenticate(oauth_params[:password])
      incorrect_login
    elsif !@user && !(all_required?)
      incorrect_params
    end
  end

  def incorrect_login
    @user = {message: 'Incorrect login method!'}
    @status = 400
  end

  def incorrect_params
    @user = {message: 'Incorrect parameters given!'}
    @status = 400
  end

  private

  def oauth_params
    @params.permit(:first_name, :last_name, :email, :password, :district_id, :username)
  end

  def all_required?
    oauth_params.keys.count == 6
  end

end
