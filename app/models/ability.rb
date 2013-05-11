class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :participant
      can :read, :all
    end

    if user.type.nil?
      can :read, :all
    end
    if user.role? :expert
      can :manage, [Work, WorkNomination, Estimation, Basket]
      can :read, [Work, WorkNomination, Estimation, Basket]
      can :access, [Work, WorkNomination, Estimation, Basket]
    end
    if user.role? :moderator
      can :manage, :all
    end

    if user.role? :admin
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    end
  end
end
