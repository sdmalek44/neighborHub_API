class Api::V1::NeighborhoodsController < ApiController

  def index
    render json: District.all.order(:name)
  end

  def show
    if District.exists?(params[:id])
      @district = District.find(params[:id])
      render json: @district, serializer: DistrictProjectSerializer
    else
      render status: 404
    end
  end

end
