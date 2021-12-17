class AddBookingToFlight < ActiveRecord::Migration[6.1]
  def change
    add_reference :flights, :booking, foreign_key: true
  end
end
