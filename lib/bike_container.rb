module BikeContainer

	DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "I don't accept #{bike}s" if bike.class != Bike
		raise "There is no more room for bikes" if full?
		bikes << bike
	end

	def release(bike = nil)
		raise "I don't have any #{bike}s." if bike.class != Bike
		raise "I don't know what to release" if bike == nil
		raise "I don't have any bikes." if empty?
		bikes.delete(bike)
	end

	def empty?
		bike_count == 0
	end

	def full?
		bike_count == capacity
	end

	def working_bikes
		@bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		@bikes.select {|bike| bike.broken?}
	end

end