class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is? :admin
      can :manage, User
      can :manage, Food
      can :manage, Recipe
    else
      can :manage, User, user: user
      can :manage, Food, user: user
      can :manage, Recipe, user:
    end
  end
end
