class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  validates :departure_time, presence: true
  validates :flight_duration, presence: true

  scope :unique_departure_times, -> { pluck(:departure_time).map { |a| a.strftime('%B %d, %Y') }.uniq }
end
