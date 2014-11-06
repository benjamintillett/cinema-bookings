describe Theatre do 

	let(:valid_booking) { double :booking, seat_numbers: [4,5], row: 1}
	let(:row_one) { double :row }
	let(:roundhouse) { Theatre.new(100) }
	before do 
		allow(roundhouse).to receive(:row).with(1).and_return(:row_one)
	end

	it "can have 100 rows" do 
		expect(roundhouse.rows.count).to eq 100
	end

	context "an empty theatre" do 

		let(:empty_theatre) { Theatre.new(100) }

		it "can book a valid booking" do 
			expect(empty_theatre.book_booking!(valid_booking)).to eq true			
		end

		it "the correct seats are booked" do 
			allow(empty_theatre).to receive(:row).with(1).and_return(row_one)
			valid_booking.seat_numbers.each do |seat_number|
				expect(row_one).to receive(:book_seat!).with(seat_number)
			end
			empty_theatre.book_booking!(valid_booking)
		end


	end


end