class Row

	attr_accessor :seats

	def initialize(number_of_seats = 50)
		@seats = Array.new(50, Seat.new)
	end

	def length 
		seats.length
	end

	def seat_booked?(seat_number)
		seats[seat_number]
	end

	def book_seat!(seat_number)
		self.seats[seat_number] = !seats[seat_number] 
	end

	def seat(seat_number)
		seats[seat_number]
	end

	def book_seat2!(seat_number)
		seat(seat_number).book!
	end

	def book_seats2!(requested_seats)
		requested_seats.each { |seat_number| seat(seat_number).book! }
	end

	def seats_unavailable?(requested_seats)
		leaves_single_seat?(requested_seats)   		||
		contains_booked_seat?(requested_seats) 		||
		starts_two_above_booked?(requested_seats)   ||
		ends_two_bellow_booked?(requested_seats)

	end

	def book_seats!(seat_numbers)
		return false if unavailable?(seat_numbers)
		seat_numbers.each { |seat_number| book_seat!(seat_number) } 
		true
	end

	def unavailable?(seat_numbers)
	   	leaves_single_seat?(seat_numbers) 		|| 
	   	contains_booked_seat?(seat_numbers) 	||
	   	starts_two_above_booked?(seat_numbers)	||
	   	ends_two_bellow_booked?(seat_numbers)	
					   
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