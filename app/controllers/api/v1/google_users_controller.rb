class Api::V1::GoogleUsersController < ApiController


  def create
    user = User.find_by_email(oauth_params[:email])
    if user.nil? && all_required?
      user = User.create(oauth_params)
      status = 200
    elsif user && !(user.authenticate(oauth_params[:password]))
      status = 400
      user = {message: 'Incorrect login method!'}
    elsif !(all_required?)
      user = {message: 'Incorrect parameters given!'}
      status = 400
    end
    render json: user, status: status
  end

  private

  def oauth_params
    params.permit(:first_name, :last_name, :email, :password, :district_id, :username)
  end

  def all_required?
    oauth_params.keys.count == 6
  end

end
