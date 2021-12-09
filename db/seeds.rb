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

times = []
Date.today.step(Date.today + 1, 1.0 / (24 * 60)) { |t| times.push(t) }

airports = [4, 5, 6, 7, 8, 9, 10, 13, 14]

airports.each do |depart|
  airports.each do |arrive|
    next if depart == arrive

    length = rand(90..300)
    dates.each do |d|
      rand(1..3).times do
        t = times[rand(times.length)].to_datetime
        Flight.create!(
          departure_time: DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone),
          flight_duration: length,
          departure_airport_id: depart,
          arrival_airport_id: arrive
        )
      end
    end
  end
end
