class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :view, :free if user.has_role? :free
      can :view, :silver if user.has_role? :silver
      can :view, :gold if user.has_role? :gold
      can :view, :platinum if user.has_role? :platinum
    end
    can :manage, Task, user_id: user.id
    can :manage, Account, user_id: user.id
    can :manage, Lead, user_id: user.id
    can :manage, Opportunity, user_id: user.id
    can :manage, Customer, user_id: user.id
  end
end