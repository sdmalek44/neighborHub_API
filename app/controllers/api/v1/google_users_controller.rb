class Api::V1::GoogleUsersController < ApiController


  def create
    results = CreateGoogleUsersPresenter.new(params).validate_creation
    render json: results.user, status: results.status
  end



end
