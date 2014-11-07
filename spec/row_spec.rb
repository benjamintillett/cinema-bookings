describe Row do 

	let(:row) { Row.new(50) }


	it "can be intialzed with 50 seats" do 
		expect(row.length).to eq 50 
	end

	it "knows the first seat is not booked" do
		expect(row.seat_booked?(0)).to eq false
	end

	it "can book a seat" do 
		expect(row.book_seat!(0)).to eq true
	end

	it " the seat is booked after booking" do 
		row.book_seat!(0)
		expect(row.seat_booked?(0)).to eq true
	end

	context "an empty row" do 

		let(:seats_request) { [4,5] }
		let(:unavailable_seats_request) { [1,2] }
		let(:unavailable_seats_request2) { [47,48] }
		
		it "can book requested seats " do 
			expect(row.book_seats!(seats_request)).to eq true			
		end

		it "the seats are booked after booking" do 
			row.book_seats!(seats_request)
			seats_request.each do |seat_number|
				expect(row.seat_booked?(seat_number)).to eq true
			end
		end

		it "rejects seat request that start at 1" do 
			expect(row.book_seats!(unavailable_seats_request)).to eq false			
		end

		it "rejects seat request that start end at 48" do 
			expect(row.book_seats!(unavailable_seats_request2)).to eq false			
		end
	end

	context "a non empty row" do 

		let(:non_empty_row) { Row.new(50) }
		let(:unavailable_seats_request3) { [2,4] }
		let(:unavailable_seats_request4) { [6,10] }
		let(:unavailable_seats_request5) { [0,2] }
		before do 
			non_empty_row.book_seat!(4)						
		end

		it "rejects a request that contains 4" do
			expect(non_empty_row.book_seats!(unavailable_seats_request3)).to eq false			
		end

		it "rejects a request that starts two above 4" do 
			expect(non_empty_row.book_seats!(unavailable_seats_request4)).to eq false			
		end

		it "reject seats that end two below from 4" do 
			expect(non_empty_row.book_seats!(unavailable_seats_request5)).to eq false
		end 

	end

end







