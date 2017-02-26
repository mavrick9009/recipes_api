class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    case user
    when SuperUser
      can :manage, :all
    when BasicUser
      can [:edit, :update], User, :id => user.id

      can [:read], Recipe
      can [:edit, :update], Recipe, :user_id => user.id
    else
    end
  end
end
