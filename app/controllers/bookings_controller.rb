class BookingsController < ApplicationController
=begin
  def create
    @booking = Booking.new

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:booking][:flight])
  end
end
