class UpdateUserPresenter
  def initialize(params)
    @params = params
  end

  def validate_update
    user = User.find(@params[:id])
    user.update(oauth_params)
    if user.save
      status = 200
    else
      user = {message: "Unable to update"}
      status = 400
    end
    {user: user, status: status}
  end

  private

  def oauth_params
    @params.permit(:first_name, :last_name, :email, :district_id, :username, :password)
  end
end
