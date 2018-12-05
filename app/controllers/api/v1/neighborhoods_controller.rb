class Api::V1::NeighborhoodsController < ApiController

  def index
    render json: District.all.order(:name)
  end

  def show
    @presenter = ShowNeighborhoodsPresenter.new(params[:id])
    render json: @presenter.body, status: @presenter.status, serializer: @presenter.serializer
  end

end
