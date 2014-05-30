require_relative 'bike_container'


class Van

	include BikeContainer

	def take(source)
		bikes << source.release
	end

	

end