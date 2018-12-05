class Api::V1::NeighborhoodsController < ApiController

  def index
    render json: District.all.order(:name)
  end

  def show
    results = ShowNeighborhoodsPresenter.new(params[:id])
    render json: results.body, status: results.status, serializer: results.serializer
  end

end
