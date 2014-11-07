describe Seat do
	
	let(:seat) { Seat.new }


	it "knows if it is booked?" do 
		expect(seat).not_to be_booked
	end

	it "can be booked" do 
		seat.book!
		expect(seat).to be_booked 
	end

end