class Location
  attr_reader :lat, :long

  def initialize(json)
    @lat = json[:results][0][:locations][0][:latLng][:lat]
    @long = json[:results][0][:locations][0][:latLng][:lng]
  end
end
