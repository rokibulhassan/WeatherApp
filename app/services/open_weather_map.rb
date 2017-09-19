require 'rest-client'

class OpenWeatherMap
  attr_reader :status, :error

  def initialize(query)
    @query = query
    @app_id = 'be6267ba1a9b26f6dc79a2ca5918f381'
    @api_end = 'http://api.openweathermap.org/data/2.5'
  end

  def weather
    url = "#{@api_end}/weather?id=#{@query}&APPID=#{@app_id}"
    make_request(url)
  end

  private

  def headers
    {content_type: :json, accept: :json}
  end

  def make_request(path)
    response = RestClient.get(path, headers)
    return JSON.parse(response)
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end

end
