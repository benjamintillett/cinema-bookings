describe TextParser do

  let(:my_parser) { TextParser.new("./spec/text.txt") }
  let(:first_booking) { "<0>,<1>:<5>,<1>:<7>" }

  it "intialies with a file_path" do 
    expect(my_parser.file_path).to eq("./spec/text.txt")
  end

	it "can read a the contents of a file" do 
		expect(my_parser.read_file).to eq("(<0>,<0>:<5>,<0>:<7>),(<1>,<10>:<20>,<10>:<50>),(<2>,<22>:<4>,<22>:<7>),(<3>,<99>:<5>,<99>:<7>)")
	end

  context "retreiving data from a booking string" do 

    it "can split the file contents to an array of bookings" do 
      expect(my_parser.bookings).to eq (["<0>,<0>:<5>,<0>:<7>","<1>,<10>:<20>,<10>:<50>","<2>,<22>:<4>,<22>:<7>","<3>,<99>:<5>,<99>:<7>"])
    end

    it "can get the id" do 
      expect(my_parser.booking_id(first_booking)).to eq 0
    end

    it "can get the row number" do 
      expect(my_parser.booking_row_number(first_booking)).to eq 1
    end

    it "can get the index of the first seat" do 
      expect(my_parser.first_seat_index(first_booking)).to eq 5
    end

    it "can get the index of the last seat" do 
      expect(my_parser.last_seat_index(first_booking)).to eq 7
    end

  end

end 
