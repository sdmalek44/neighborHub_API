class ShowUserPresenter
  attr_reader :user,
              :status

  def initialize(user_id)
    @user = User.find_by(id: user_id)
    @status = 200
  end

  def validate_look_up
    not_found unless @user
    self
  end

  def not_found
    @status = 404
    @user = {message: "User Not Found"}
  end

end
