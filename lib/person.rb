class Person

	def initialize(bike = nil)
		@bike = bike
	end

	def has_bike?
		@bike
	end

	def take_bike_from(station)
		@bike = station.release
	end

	def falls
		return @bike.break! if @bike != nil
	end

	def return_bike
		@bike = nil
	end

end