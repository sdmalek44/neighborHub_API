class ShowNeighborhoodsPresenter

  def initialize(district_id)
    @district_id = district_id
  end

  def error_message
    {message: "Not Found"}
  end

  def district
    @district ||= District.find_by(id: @district_id)
  end

  def body
    district || error_message
  end

  def status
    return 200 if district
    404
  end

  def serializer
    return DistrictProjectSerializer if district
  end
end
