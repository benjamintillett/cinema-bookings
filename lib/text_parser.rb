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

end