class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.user?
      can :manage, Device, user_id: user.id
    else
      can :manage, Device, user_id: user.id
    end

  end
end
