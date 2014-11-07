describe Row do 

	let(:empty_seat)  { double :seat, booked?: false }
	
	before do 
		Seat.stub(:new).and_return(empty_seat)
	end

	let(:row) { Row.new(50) }

	it "knows if a seat is booked" do
		expect(row.seats.first.booked?).to eq false
	end

	it "can book a seat" do 
		expect(empty_seat).to receive(:book!)
		row.book_seat2!(1)
	end





	context "an empty row" do 

		let(:seat_four) { double :seat }
		let(:seat_five) { double :seat }
		let(:seats_request1) { [4,5] }
		let(:unavailable_seats_request) { [1,2] }
		let(:unavailable_seats_request2) { [47,48] }
		
		it "can book requested seats " do 
			allow(row).to receive(:seat).with(4).and_return(seat_four)
			allow(row).to receive(:seat).with(5).and_return(seat_five)						
			expect(seat_four).to receive(:book!)
			expect(seat_five).to receive(:book!)
			row.book_seats2!(seats_request1)
		end

		it "knows a request for seats 4 and 5 is available" do 
			expect(row.seats_unavailable?(seats_request1)).to be false
		end

		it "knows a request starting at seat 1 is not available" do
			expect(row.seats_unavailable?(unavailable_seats_request)).to be true
		end

		it "knows that end at 48" do 
			expect(row.seats_unavailable?(unavailable_seats_request2)).to be true			
		end	

	end

	context "a non empty row" do 


		let(:booked_seat) {	double :seat, booked?: true}
		let(:non_empty_row) { Row.new(50) }
		let(:unavailable_seats_request3) { [2,3,4,5] }
		let(:unavailable_seats_request4) { [6,7,8,9,10] }
		let(:unavailable_seats_request5) { [0,1,2] }


		before do
			allow(non_empty_row).to receive(:seat).and_return(empty_seat) 
			allow(non_empty_row).to receive(:seat).with(4).and_return(booked_seat)
		end

		it "knows a request containing 4 is unavailable" do
			expect(non_empty_row.seats_unavailable?(unavailable_seats_request3)).to be true			
		end

		it "knows a request that starts two above 4 is unavailable" do 
			expect(non_empty_row.seats_unavailable?(unavailable_seats_request4)).to be true			
		end

		it "knows a request that ends two above 4 is unavailable" do 
			expect(non_empty_row.seats_unavailable?(unavailable_seats_request5)).to be true			
		end

	end

end







