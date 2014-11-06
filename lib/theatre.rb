class Theatre 

	attr_reader :rows

	def initialize(number_of_rows = 100)
		@rows = []
		build_rows(number_of_rows)
	end

	def build_rows(number_of_rows)
		number_of_rows.times { @rows << Row.new }
	end

end