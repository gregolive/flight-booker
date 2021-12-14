class Booking < ApplicationRecord
  has_many :flights
  has_many :passengers
end
