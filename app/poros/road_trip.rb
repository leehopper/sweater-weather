class RoadTrip
  attr_reader :id, :type, :start_city, :end_city, :travel_time, :weather

  def initialize(time, rt_params)
    @id = nil
    @start_city = rt_params[:origin]
    @end_city = rt_params[:destination]
    @travel_time = time
    @weather = nil
  end

  def add_weather(forecast)
    @weather = forecast
  end
end
