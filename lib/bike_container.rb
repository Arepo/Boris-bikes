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
		raise "There is no more room for bikes" if full?
		bikes << bike
	end

	def release(bike)
		raise "I don't have any bikes. Fak off." if empty?
		bikes.delete(bike)
	end

	def empty?
		bikes.count == 0
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		@bikes.reject {|bike| bike.broken?}
	end

end