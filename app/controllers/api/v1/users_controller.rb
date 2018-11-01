class Api::V1::UsersController < ApiController

  def index
    render json: User.all
  end

  def show
    results = ShowUserPresenter.new(params).validate_look_up
    render json: results[:user], status: results[:status]
  end

  def create
    results = CreateUserPresenter.new(params).validate_creation
    render json: results[:user], status: results[:status]
  end

  def update
    results = UpdateUserPresenter.new(params).validate_update
    render json: results[:user], status: results[:status]
  end

end
