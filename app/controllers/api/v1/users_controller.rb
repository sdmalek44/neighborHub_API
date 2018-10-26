class Api::V1::UsersController < ApiController

  def index
    render json: User.all
  end

  def create
    
  end

end
