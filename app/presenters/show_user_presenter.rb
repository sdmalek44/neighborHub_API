class ShowUserPresenter
  def initialize(user_id)
    @user = User.find_by(id: user_id)
  end

  def body
    if user
      user
    else
      failure_message
    end
  end

  def failure_message
    {message: "User Not Found"}
  end

  def status
    if user
      200
    else
      404
    end
  end

  private

  attr_reader :user

end
