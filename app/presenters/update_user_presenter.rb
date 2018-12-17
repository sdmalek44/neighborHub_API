class UpdateUserPresenter
  attr_reader :user,
              :status

  def initialize(params)
    @status = 400
    @params = params
    @user = User.find_by(id: @params[:id])
  end

  def body
    if user && user.update(oauth_params)
      set_success
      user
    else
      failure_message
    end
  end

  def failure_message
    {message: "Unable to update"}
  end

  def set_success
    @status = 200
  end

  private

  def oauth_params
    @params.permit(:first_name, :last_name, :email, :district_id, :username, :password)
  end
end
