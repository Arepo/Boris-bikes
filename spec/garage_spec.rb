require 'garage'

describe Garage do

	let(:garage) { Garage.new }
	let(:bike) { double :bike, class: Bike }

	it 'should be able to fix a bike' do 
		expect(bike).to receive(:fix!)
		garage.fix_bike(bike)
	end

	it 'should fix the bike instantly upon receiving it' do
		expect(bike).to receive(:fix!)
		garage.dock(bike)
	end

end