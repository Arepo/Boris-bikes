require 'garage'

describe Garage do

	it 'should be able to fix a bike' do 
		garage = Garage.new
		bike = double :bike, fix!: :fbike
		expect(bike).to receive(:fix!)
		(garage.fix_bike(bike))
	end

end