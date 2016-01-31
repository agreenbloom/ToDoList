class Item < ActiveRecord::Base
	# attr_accessor :incomplete, :pending, :complete

	# state_machine :state, initial: :draft do
	# 	before_transition draft: any - :draft, do: :set_incomplete

	# 	after_transition on: :is_pending, do: :set_pending
	# 	after_transition on: :is_complete, do: :set_complete	
	# end

	# def set_incomplete
	# 	@incomplete = true
	# end

	# def set_pending
	# 	@incomplete = false	
	# 	@pending = true
	# end

	# def set_complete
	# 	@pending = false
	# 	@complete = true 
	# end


	# def initialize
	# 	@incomplete = false
	# 	@pending = false
	# 	@complete = false
	# 	super()
	# end


	 state_machine :state, initial: :incomplete do

    event :in_progress do
      transition incomplete: :in_progress 
    end

    event :completed do
      transition any => :completed     
    end

    after_transition to: :in_progress do |item|
      item.in_progress_at = Time.current
      item.save
    end

    after_transition to: :completed do |item|
      item.completed_at = Time.current
      item.save
    end
  end
end