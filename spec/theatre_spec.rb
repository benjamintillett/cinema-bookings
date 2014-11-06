describe Theatre do 

	let(:roundhouse) { Theatre.new(100) }

	it "can have 100 rows" do 
		expect(roundhouse.rows.count).to eq 100
	end

end