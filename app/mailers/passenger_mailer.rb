class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Flight Confirmation with bookr')
  end
end
