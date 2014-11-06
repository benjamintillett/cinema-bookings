class Theatre 

	attr_reader :rows

	def initialize(number_of_rows = 100)
		@rows = []
		build_rows(number_of_rows)
	end

	def build_rows(number_of_rows)
		number_of_rows.times { @rows << Row.new }
	end

	def row(row_number)
		rows[row_number]
	end

	def book_booking!(booking)
		booking.seat_numbers.each { |seat_number| book_seat!(seat_number, booking.row)}
		true
	end

	def book_seat!(seat_number,row_number)
		row(row_number).book_seat!(seat_number)
	end

end