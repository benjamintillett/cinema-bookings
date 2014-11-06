class TextParser

	attr_accessor :file_path

	def initialize(file_path)
		@file_path = file_path
	end

	def read_file
		File.open(file_path, "r"){ |file| file.read }
	end

	def bookings
		read_file[1...-1].split("),(")
	end

	def booking_id(booking)
		booking.split(',').first.gsub(/[<>]/,"").to_i
	end

	def booking_row_number(booking)
		booking_array(booking)[1].split(":")[0].to_i
	end

	def first_seat_index(booking)
		booking_array(booking)[1].split(":")[1].to_i
	end

	def last_seat_index(booking)
		booking_array(booking)[2].split(":")[1].to_i
	end

	private

		def booking_array(booking)
			booking.gsub(/[<>]/,"").split(",")
		end 

end