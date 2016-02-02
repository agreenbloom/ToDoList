class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # #
    user ||=User.new
    if user.id 
      # can :manage, Item, id: user.id
      can [:index, :show], Item, user_id: user.id
    elsif user.role == 'admin'
    	can :manage, :all
    end

  end
    


end
