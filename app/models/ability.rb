class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, [Post, Comment]

    return unless user.present?
    can :create, [Post, Comment]
    can :destroy, [Post, Comment], author_id: user.id

    return unless user.admin?
    can :manage, :all
  end
end
