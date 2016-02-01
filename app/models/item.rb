class Item < ActiveRecord::Base

	belongs_to :user
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






end