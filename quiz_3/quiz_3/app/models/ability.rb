class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :manage, Idea do |idea|
      user == idea.user
    end

    # can :manage, Answer do |answer|
    #   user == answer.user || user == answer.question.user
    # end

    can :like, Idea do |idea|
      user != idea.user
    end

    cannot :like, Idea do |idea|
      user == idea.user
    end

    can :destroy, Like do |like|
      user == like.user
    end

    can :join, Idea do |idea|
      user != idea.user
    end

    cannot :join, Idea do |idea|
      user == idea.user
    end

    can :destroy, Membership do |membership|
      user == membership.user
    end


    can :destroy, Comment do |comment|
      user == comment.user
    end

    cannot :destroy, Comment do |comment|
      user != comment.user
    end

  end
end
