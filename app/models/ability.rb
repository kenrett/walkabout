class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      guide_permissions(user)
    else
      can :read, :all
    end
  end

  def guide_permissions(user)
    can :manage, :all
  end
end
