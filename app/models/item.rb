class Item < ActiveRecord::Base

  state_machine :state, :initial  => :pending do
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

  	end
 	end


end   