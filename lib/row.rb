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

end