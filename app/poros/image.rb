class Image
  attr_reader :id, :location, :image_url, :source, :photographer, :photographer_profile

  def initialize(json, location)
    @id = nil
    @location = location
    @image_url = json[:urls][:raw]
    @source = 'unsplash.com'
    @photographer = json[:user][:name]
    @photographer_profile = json[:user][:links][:self]
  end
end
