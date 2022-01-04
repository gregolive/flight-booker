class PassengerMailer < ApplicationMailer
  default from: 'noreply@bookr.com'

  def confirmation_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    mail(to: @passenger.email, subject: 'Flight Confirmation with bookr')
  end
end
