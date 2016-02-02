class Item < ActiveRecord::Base
	belongs_to :user

  	state_machine :state, :initial  => :pending do
	  	event :button_press do 
	  		transition :pending => :completed
	  	end

  	event :button_press do	
  		transition :completed => :pending
  	end 

  	event :button_reject do 
  		transition :pending => :wont_do
  	end


  	event :button_press do
  		transition :wont_do => :pending
  	end
 	end

	# attr_accessor :incomplete, :pending, :complete
	# 	after_transition on: :is_pending, do: :set_pending
	# 	after_transition on: :is_complete, do: :set_complete
	# end
	# def set_pending
	# 	@incomplete = false
	# 	@pending = true
	# end

	# def set_complete
	# 	@pending = false
	# 	@complete = true
	# end

end   