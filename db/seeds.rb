# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = ['NRT', 'Tokyo'],
           ['PKX', 'Beijing'],
           ['JFK', 'New York'],
           ['LAX', 'Los Angeles'],
           ['YYZ', 'Toronto'],
           ['LHR', 'London'],
           ['CDG', 'Paris'],
           ['SYD', 'Sydney'],
           ['ICN', 'Seoul']

airports.each do |code, city|
  Airport.create(code: code, city: city)
end

flights = [
  {
    departure_time: DateTime.strptime("12/12/2021 17:00", "%m/%d/%Y %H:%M"),
    flight_duration: 200,
    departure_airport_id: 10,
    arrival_airport_id: 14
  }
]

flights.each do |flight|
  Flight.create(flight)
end
