class ShowUserPresenter

  def initialize(params)
    @params = params
  end

  def find_user
    user = User.find_by(id: @params[:id])
    if user
      status = 200
    else
      status = 404
      user = {message: "User Not Found"}
    end
    {user: user, status: status}
  end
end
