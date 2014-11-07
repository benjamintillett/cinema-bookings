describe Theatre do 

	let(:valid_booking) { double :booking, seat_numbers: [4,5], row: 1}
	let(:row_one) { double :row, book_seat!: true }
	let(:roundhouse) { Theatre.new(100) }


	it "can have 100 rows" do 
		expect(roundhouse.rows.count).to eq 100
	end

	context "an empty theatre" do 

		let(:empty_theatre) { Theatre.new(100) }

		before do 
			allow(empty_theatre).to receive(:row).with(1).and_return(row_one)
		end

		it "can book a valid booking" do 
			expect(empty_theatre.book_booking!(valid_booking)).to eq true			
		end

		it "the correct seats are booked" do 
			valid_booking.seat_numbers.each do |seat_number|
				expect(row_one).to receive(:book_seat!).with(seat_number)
			end
			empty_theatre.book_booking!(valid_booking)
		end
	end

	# context "a non empty theatre" do 
	# 	let(:non_empty_theatre) { Theatre.new(100) }
	# 	# let(:row_one) { double :row, book_seat }

	# 	before do 
	# 		allow(non_empty_theatre).to receive(:row).with(0).and_return(1)
	# 	end

	# 	it "test" do 
	# 		expect(non_empty_theatre.rows).to eq 1
	# 	end



	# end


end