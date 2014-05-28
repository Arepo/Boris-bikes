require 'van'

describe Van do 

	let(:van) {Van.new}
	let(:station) {DockingStation.new}
	let(:bike) {Bike.new}
	

	it 'must take offered bike from docking station' do
		station.dock(bike)
		van.take(bike, station)
		expect(van.bike_count).to eq 1
		expect(station.bike_count).to eq 0
	end

end