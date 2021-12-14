# Airport Model

airport_list = ['NRT', 'Tokyo'],
               ['PKX', 'Beijing'],
               ['JFK', 'New York'],
               ['LAX', 'Los Angeles'],
               ['YYZ', 'Toronto'],
               ['LHR', 'London'],
               ['CDG', 'Paris'],
               ['SYD', 'Sydney'],
               ['ICN', 'Seoul']

airport_list.each do |code, city|
  Airport.create(code: code, city: city)
end

# Flight Model

dates = (Date.today..(Date.today + 1.month)).to_a
airports = [4, 5, 6, 7, 8, 9, 10, 13, 14]

airports.each do |depart|
  airports.each do |arrive|
    next if depart == arrive

    length = rand(90..300)
    dates.each do |d|
      rand(1..3).times do
        Flight.create(
          departure_time: DateTime.new(d.year, d.month, d.day, rand(6..23), rand(0..59)),
          flight_duration: length,
          departure_airport_id: depart,
          arrival_airport_id: arrive
        )
      end
    end
  end
end
