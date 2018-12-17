class Api::V1::GoogleUsersController < ApiController

  def create
    results = CreateGoogleUsersPresenter.new(params)
    render json: results.body, status: results.status
  end

end
