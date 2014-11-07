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
		return true if leaves_single_seat?(seat_numbers) || contains_booked_seat?(seat_numbers)
	end

	def leaves_single_seat?(seat_numbers)
		true if seat_numbers[0] == 1 || seat_numbers[1] == 48
	end

	def contains_booked_seat?(seat_request)
		seat_request.each { |seat| return true if seat_booked?(seat) }
		false
	end

end