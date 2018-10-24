class Api::V1::NeighborhoodsController < ApplicationController

  def index
    render json: District.all
  end

end
