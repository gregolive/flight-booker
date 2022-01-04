class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]
  before_action :set_flight, only: %i[new create]

  def new
    @booking = Booking.new

    @num_passengers = params[:booking][:num_passengers].to_i
    @num_passengers.times { @booking.passengers.build(params[:booking][:passengers]) }
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.flight = @flight
    @passengers = @booking.passengers

    respond_to do |format|
      if @booking.save
        @passengers.each do |passenger|
          PassengerMailer.with(passenger: passenger, flight: @flight).confirmation_email.deliver_now
        end

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
    @passengers = @booking.passengers
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_flight
    @flight = Flight.find(params[:booking][:flight])
  end

  def booking_params
    params.require(:booking).permit(passengers_attributes: %i[id name email])
  end
end
