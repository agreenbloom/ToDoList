class Item < ActiveRecord::Base

  state_machine :state, :initial  => :pending do
<<<<<<< HEAD
  	event :complete do 
  		transition from: :pending, to: :completed
  	end

  	event :incomplete do	
  		transition from: :completed, to: :pending
  	end 

  	event :reject do 
  		transition from: :pending, to: :wont_do
  	end

  	event :incomplete do
  		transition from: :wont_do, to: :pending
=======
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
>>>>>>> 2e5c42c6a4aeb5f2258ea079e86fb58a7d20ee87
  	end
 	end


end   