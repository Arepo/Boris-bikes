require_relative 'bike_container'


class Van

	include BikeContainer

	def take(bike, source)
		bikes << source.release(bike)
	end


end