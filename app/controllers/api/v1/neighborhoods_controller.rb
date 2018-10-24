class Api::V1::NeighborhoodsController < ApiController

  def index
    render json: District.all
  end

end
