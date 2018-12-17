class Api::V1::UsersController < ApiController

  def index
    render json: User.all
  end

  def show
    results = ShowUserPresenter.new(params[:id])
    render json: results.body, status: results.status
  end

  def create
    results = CreateUserPresenter.new(params)
    render json: results.body, status: results.status
  end

  def update
    results = UpdateUserPresenter.new(params)
    render json: results.body, status: results.status
  end

end
