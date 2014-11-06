class Booking

	attr_reader :first_seat, :last_seat, :seat_numbers

	def initialize(data)
		@id = data[:id]
		@row = data[:row]
		@first_seat = data[:first_seat]
		@last_seat = data[:last_seat]
		@seat_numbers = get_seat_numbers
	end

	def get_seat_numbers
		(first_seat..last_seat).to_a
	end




end