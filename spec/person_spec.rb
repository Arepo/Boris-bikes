require 'person'

describe Person do
	
	let(:person) {Person.new}

	it 'should not have a bike to begin with' do
		expect(person).not_to have_bike
	end

	it 'should be able to take a bike' do
		person.take_bike_from(:station)
		expect(person).to have_bike
	end

	it 'should remove a bike from the docking station' do
		# station = double :station
		# expect(station).to receive(:release).and_return(:bike)
		# person.take_bike_from(station)
	end

	it 'should break bike if he/she falls' do
		bike = double :bike
		expect(bike).to receive(:break!)
		Person.new(bike).falls
	end

end