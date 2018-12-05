class UpdateUserPresenter
  attr_reader :user,
              :status

  def initialize(params)
    @params = params
    @user = User.find_by(id: @params[:id])
  end

  def validate_update
    @user.update(oauth_params) if @user
    set_status
    self
  end

  def set_status
    return set_success if @user && @user.save
    set_error
  end

  def set_success
    @status = 200
  end

  def set_error
    @user = {message: "Unable to update"}
    @status = 400
  end

  private

  def oauth_params
    @params.permit(:first_name, :last_name, :email, :district_id, :username, :password)
  end
end
