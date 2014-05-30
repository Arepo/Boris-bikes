class Person

	def initialize(bike = nil)
		@bike = bike
	end

	def has_bike?
		@bike
	end

	def take_bike_from(station)
		@bike = true
		# station.release(station.working_bikes.last)

	end

	def falls
		return @bike.break! if @bike != nil
	end

end