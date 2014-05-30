require 'person'

describe Person do
	
	let(:noob) {Person.new}
	let(:bike) { double :bike }
	let(:jockey) {Person.new(bike)}

	it 'should not have a bike to begin with' do
		expect(noob).not_to have_bike
	end

	it 'should be able to take a bike' do
		station = double :station, release: :bike
		noob.take_bike_from(station)
		expect(noob).to have_bike
	end

	it 'should remove a bike from the docking station' do
		station = double :station
		expect(station).to receive(:release).and_return(:bike)
		noob.take_bike_from(station)
	end

	it 'should break bike if he/she falls' do
		expect(bike).to receive(:break!)
		jockey.falls
	end

	it 'should be able to return a bike' do
		jockey.return_bike
		expect(jockey).not_to have_bike
	end

end