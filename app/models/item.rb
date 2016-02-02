class Item < ActiveRecord::Base

  state_machine :state, :initial  => :pending do
  	event :button do 
  		transition :pending => :completed
  	end

  	event :button do	
  		transition :completed => :pending
  	end 

  	event :reject do 
  		transition :pending => :wont_do
  	end

  	event :button do
  		transition :wont_do => :pending
  	end
 	end


end   