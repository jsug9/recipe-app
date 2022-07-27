class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :manage, User, user: user
      can :manage, Food, user: user
      can :manage, Recipe, user: user
      can :manage, RecipeFood, user: user
    end
  end
end
