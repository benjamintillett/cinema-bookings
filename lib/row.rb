class Row

	attr_accessor :seats

	def initialize(number_of_seats = 50)
		@seats = Array.new(50,false)
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
		seats_request.each { |seat| return true if seat_booked?(seat) }
		false
	end

	def starts_two_above_booked?(seats_request)
		seat_booked?(seats_request.first - 2)
	end

	def ends_two_bellow_booked?(seats_request)
		seat_booked?(seats_request.last + 2)
	end



end