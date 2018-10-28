class Api::V1::GoogleUsersController < ApiController


  def create
    user = User.find_by_email(oauth_params[:email])
    if user && user.password_digest && user.token.nil?
      user.update(token: oauth_params[:token])
      render json: user
    elsif user && user.token == oauth_params[:token]
      render json: user
    elsif user = User.create(oauth_params)
      render json: user if user.save
    end
    unless user && user.save
      render json: {message: "Incorrect info! Could not find or create"}, status: 400
    end
  end

  private

  def oauth_params
    params.permit(:first_name, :last_name, :email, :token, :district_id, :username)
  end
end
