class Booking < ApplicationRecord
  has_one :flight
  has_many :passengers
end
