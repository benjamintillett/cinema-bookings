describe TextParser do

  let(:my_parser) { TextParser.new("./spec/text.txt") }
  let(:first_booking) { "<0>,<0>:<5>,<0>:<7>" }

  it "intialies with a file_path" do 
    expect(my_parser.file_path).to eq("./spec/text.txt")
  end

	it "can read a the contents of a file" do 
		expect(my_parser.read_file).to eq("(<0>,<0>:<5>,<0>:<7>),(<1>,<10>:<20>,<10>:<50>),(<2>,<22>:<4>,<22>:<7>),(<3>,<99>:<5>,<99>:<7>)")
	end

  it "can split the file contents to an array of bookings" do 
    expect(my_parser.bookings).to eq (["<0>,<0>:<5>,<0>:<7>","<1>,<10>:<20>,<10>:<50>","<2>,<22>:<4>,<22>:<7>","<3>,<99>:<5>,<99>:<7>"])
  end

end 
