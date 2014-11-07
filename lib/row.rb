class Row

	attr_accessor :seats

	def initialize(number_of_seats = 50)
		@seats = Array.new(50, Seat.new)
	end

	def length 
		seats.length
	end

	def seat(seat_number)
		seats[seat_number]
	end

	def book_seat!(seat_number)
		seat(seat_number).book!
	end

	def book_seats!(requested_seats)
		requested_seats.each { |seat_number| seat(seat_number).book! }
	end

	def seats_unavailable?(requested_seats)
		leaves_single_seat?(requested_seats)   		||
		contains_booked_seat?(requested_seats) 		||
		starts_two_above_booked?(requested_seats)   ||
		ends_two_bellow_booked?(requested_seats)

	end

	def leaves_single_seat?(seat_numbers)
		seat_numbers.first == 1 || seat_numbers.last == 48
	end

	def contains_booked_seat?(seats_request)
		seats_request.inject(false) { |memo,seat_number| memo || seat(seat_number).booked? }
	end

	def starts_two_above_booked?(seats_request)
		seat(seats_request.first - 2).booked?
	end

	def ends_two_bellow_booked?(seats_request)
		seat(seats_request.last + 2).booked?
	end

end