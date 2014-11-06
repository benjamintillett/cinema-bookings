describe Booking do 

	let(:valid_booking) { Booking.new( id: 1, row: 2, first_seat: 4, last_seat: 5 ) }

	it "a has an array of requested seat numbers" do 
		expect(valid_booking.seat_numbers).to eq [4,5]
	end


end