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
		@bike.break! unless @bike.nil?
	end

	def return_bike_to(station)
		station.dock(@bike)
		@bike = nil
	end

end