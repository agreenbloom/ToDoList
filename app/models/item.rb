class Item < ActiveRecord::Base

	belongs_to :user
	# attr_accessor :incomplete, :pending, :complete

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
end

