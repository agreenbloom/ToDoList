class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.id 
      # can :manage, Item, id: user.id
      can [:index, :show, :create, :new], Item, user_id: user.id
    end
  end
    


end
