# frozen_string_literal: true

class BackgroundsFacade
  def self.find_image(location)
    json = UnsplashService.get_image(location)
    Image.new(json[:results][0], location)
  end
end
