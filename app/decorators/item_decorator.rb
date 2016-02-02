class ItemDecorator < Draper::Decorator
	delegate_all
	
	def completion_status
		if item.completed?
			"task completed"
		elsif item.wont_do?
			"Will not finish task"
		else
			"pending"
		end

	end

end
