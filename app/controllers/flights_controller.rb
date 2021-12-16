class FlightsController < ApplicationController
  def index
    @departure_airport = params[:departure_airport]
    @arrival_airport = params[:arrival_airport]
    @departure_time = params[:departure_time]

    unless @departure_time.blank?
      @time = DateTime.parse(@departure_time)
      @start_time = DateTime.new(@time.year, @time.month, @time.day, 6, 0)
      @end_time = DateTime.new(@time.year, @time.month, @time.day, 11, 59)
    end

    @flights = Flight.where(
      departure_airport_id: Airport.where(city: @departure_airport),
      arrival_airport_id: Airport.where(city: @arrival_airport),
      departure_time: (@start_time..@end_time)
    ).order(:departure_time)

    @booking = Booking.new
  end
end
