class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show ]
  before_action :set_flight, only: %i[ new create ]

  def new
    @booking = Booking.new

    @num_passengers = params[:booking][:num_passengers].to_i
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.passengers.build(params[:booking][:passengers])
    @booking.flight = @flight

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

  def set_flight
    @flight = Flight.find(params[:booking][:flight])
  end

  def booking_params
    params.require(:booking).permit(passengers_attributes: [ :id, :name, :email ])
  end
end
