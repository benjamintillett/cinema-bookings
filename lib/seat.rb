class Seat 

	attr_accessor :booked

	def initialize
		@booked = false
	end

	def booked?
		booked
	end

	def book!
		self.booked = true
	end

end