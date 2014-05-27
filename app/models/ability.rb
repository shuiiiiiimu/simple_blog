class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      cannot :manage, :all
      basic_read_only
    elsif user.has_role?(:member)
      can :create, Topic
      can :update, Topic do |topic|
        (topic.user_id == user.id)
      end
      can :destroy, Topic do |topic|
         (topic.user_id == user.id)
      end

      can :create, Comment
      basic_read_only
    else
      # banned or unknown situation
      cannot :manage, :all
      basic_read_only
    end

  end

  protected
    def basic_read_only
      can :read,Topic
      can :read, Comment
    end
end
