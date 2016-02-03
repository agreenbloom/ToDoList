class Item < ActiveRecord::Base

  state_machine :state, :initial  => :pending do
  	event :check do 
  		transition :pending => :completed
  	end

  	event :check do	
  		transition :completed => :pending
  	end 

  	event :reject do 
  		transition :pending => :wont_do
  	end

  	event :check do
  		transition :wont_do => :pending
  	end
 	end


end   