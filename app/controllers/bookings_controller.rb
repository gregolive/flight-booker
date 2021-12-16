class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show ]

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:booking][:flight])
    @num_passengers = params[:booking][:num_passengers].to_i
    @passengers = []

    @num_passengers.times do
      @passengers << Passenger.new
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
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
