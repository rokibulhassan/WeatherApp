class DashboardController < ApplicationController
  def index
    @city = current_user.city
    @weather = OpenWeatherMap.new(@city.code).weather
  end

  def weather
    @city = City.find(params[:city_id])
    @weather = OpenWeatherMap.new(@city.code).weather
    render json: @weather
  end
end
