class ApiService
  def self.get_json(data)
    JSON.parse(data.body, symbolize_names: true)
  end
end
