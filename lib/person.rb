class Person

	def initialize(bike = nil)
		@bike = bike
	end

	def has_bike?
		@bike
	end
 
	def take_bike_from(station)
		bike = station.next_available_bike #station.working_bikes.pop
 
		@bike = station.release(bike)


	end

	def falls
		return @bike.break! if @bike != nil
	end

end