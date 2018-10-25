class Api::V1::NeighborhoodsController < ApiController

  def index
    render json: District.all.order(:name)
  end

  def show
    @district = District.find(params[:id])
    render json: @district, serializer: DistrictProjectSerializer
  end

end
