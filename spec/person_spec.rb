require 'person'

describe Person do
	
	let(:noob) { Person.new }
	let(:bike) { double :bike }
	let(:jockey) { Person.new(bike) }
	let(:station) {double :station, release: :bike, dock: true}

	it 'should not have a bike to begin with' do
		expect(noob).not_to have_bike
	end

	it 'should be able to take a bike' do
		noob.take_bike_from(station)
		expect(noob).to have_bike
	end

	it 'should remove a bike from the docking station' do
		expect(station).to receive(:release)
		noob.take_bike_from(station)
	end

	it 'should break bike if he/she falls' do
		expect(bike).to receive(:break!)
		jockey.falls
	end

	it 'should be able to return a bike' do
		jockey.return_bike_to(station)
		expect(jockey).not_to have_bike
	end

	it 'should give the returned bike to a station' do
		expect(station).to receive(:dock).with(bike)
		jockey.return_bike_to(station)
	end
end