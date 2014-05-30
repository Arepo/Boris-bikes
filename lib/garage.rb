class Garage

	include BikeContainer

	def dock(bike)
		raise "I don't accept #{bike}s" if bike.class != Bike 
		raise "There is no more room for bikes" if full?
		bikes << fix_bike(bike)
	end

	def fix_bike(bike)
		bike.fix!
	end

end