require 'bike_container'


class ContainerHolder; include BikeContainer; end


describe BikeContainer do

	def fill_container(container)
		20.times { container.dock(Bike.new) }
	end

	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break!}
	let(:container) { ContainerHolder.new }

	it 'should accept a bike' do
		expect(container.bike_count).to eq 0
		container.dock(bike)
		expect(container.bike_count).to eq 1
	end

	it 'should release a bike' do
		container.dock(bike)
		container.release(bike)
		expect(container.bike_count).to eq 0
	end

	it "should whinge if someone tries to remove a bike when it's empty" do
		container.bikes
		expect{container.release(bike)}.to raise_error(RuntimeError)
	end

	it "should raise a more descriptive error message if we don't specify what to release" do
		container.dock(bike)
		expect{container.release()}.to raise_error(RuntimeError)
	end

	it "should object if you try to release a pigeon" do
		expect{container.release("pigeon")}.to raise_error(RuntimeError)
	end

	it "should know when it's full" do
		expect(container).not_to be_full
		fill_container(container)
		expect(container).to be_full
	end
	
	it "should not accept a bike if it's full" do
		fill_container(container)
		expect{container.dock(bike)}.to raise_error(RuntimeError)
	end

	it "should not accept a pigeon" do
		expect{container.dock("pigeon")}.to raise_error(RuntimeError)
	end

	it 'should provide the list of working bikes' do
		container.dock(bike)
		container.dock(broken_bike)
		expect(container.working_bikes).to eq([bike])
	end

	it 'should provide a list of broken bikes' do
		container.dock(bike)
		container.dock(broken_bike)
		expect(container.broken_bikes).to eq([broken_bike])
	end

end