class CounterOnItemView
	include Sidekiq::Worker
	def perform(item)
		Item.increment_counter(:view_counter, item) 
	end 
end 