class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show ]

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:booking][:flight])
    @booking.flight = @flight
    @num_passengers = params[:booking][:num_passengers].to_i

    @num_passengers.times do
      @booking.passengers.build
    end
  end

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

  def show
    @flight = @booking.flight
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
