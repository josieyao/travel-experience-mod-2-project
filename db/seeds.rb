# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Receiver.destroy_all
Itinerary.destroy_all
Event.destroy_all
EventReceiver.destroy_all
EventUser.destroy_all
Booking.destroy_all

#HAWAII EXAMPLE:
josie = User.create(first_name: 'Josie', last_name: 'Yap', email: 'josie@gmail.com', password: 'coolbeans22')

cory = Receiver.create(first_name: 'Cory', last_name: 'Harpie', email: 'cory@gmail.com')

hawaii_itinerary = Itinerary.create(
  destination_name: 'Hawaii',
  destination_address: '1200 Hawaii Street, Honolulu, HI 96814',
  airline: 'Hawaiian Airlines',
  flight_number: 'H200',
  gate_number: '1A',
  seat_number: '15B',
  departure_airport_code: 'LAX',
  departure_date: '2019/04/01',
  departure_flight_time: '7:00AM',
  return_airport_code: 'HNL',
  return_date: '04/03/2019',
  return_flight_time: '8:00PM',
  user: josie,
  receiver: cory
)

aloha_luau = Event.create(name: 'Aloha Luau', address: '4300 Maui Rd, Honolulu, HI 96814', description: 'Enjoy an relaxing luau with free drinks and food', date: '2019/04/02', time: '3:00PM')

pineapple_tour = Event.create(name: 'Pineapple Farm Tour', address: '200 Pineapple Dr, Honolulu, HI 96812', description: 'Check out how pineapples are grown in Hawaii & enjoy delicious dole whip!', date: '2019/04/03', time: '1:00PM')

hawaii_day1 = EventReceiver.create(event: aloha_luau, receiver: cory, rating: 3)
hawaii_day2 = EventReceiver.create(event: pineapple_tour, receiver: cory, rating:  5)
hawaii_day2u = EventUser.create(event: pineapple_tour, user: josie)
hawaii_day1u = EventUser.create(event: aloha_luau, user: josie)
booking1 = Booking.create(event: aloha_luau, itinerary: hawaii_itinerary)
booking2 = Booking.create(event: pineapple_tour, itinerary: hawaii_itinerary)

#CALIFORNIA EXAMPLE
sam = User.create(first_name: 'Sam', last_name: 'Smith', email: 'sammie@gmail.com', password: 'smith11')

jane = Receiver.create(first_name: 'Jane', last_name: 'Smith', email: 'jane@gmail.com')

cali_itinerary = Itinerary.create(
  destination_name: 'California',
  destination_address: '200 Rodeo Drive, Beverly Hills, CA 90210',
  airline: 'Delta Airlines',
  flight_number: 'DL100',
  gate_number: '11A',
  seat_number: '10C',
  departure_airport_code: 'IAH',
  departure_date: '2019/05/01',
  departure_flight_time: '9:00AM',
  return_airport_code: 'LAX',
  return_date: '05/02/2019',
  return_flight_time: '9:00PM',
  user: sam,
  receiver: jane
)

hollywood_tour = Event.create(name: 'Hollywood Walk of Fame Tour', address: '700 Hollywood Drive, Hollywood, CA 90211', description: 'Find the hand prints of your favorite celebrities!', date: '2019/05/02', time: '12:00PM')

cali_day1 = EventReceiver.create(event: hollywood_tour, receiver: jane, rating: 5)
hawaii_day1u = EventUser.create(event: hollywood_tour, user: sam)
booking1 = Booking.create(event: hollywood_tour, itinerary: cali_itinerary)
