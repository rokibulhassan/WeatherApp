class DashboardController < ApplicationController
  def index
    @city = current_user.city
    @weather = OpenWeatherMap.new(@city.code).weather
  end
end
