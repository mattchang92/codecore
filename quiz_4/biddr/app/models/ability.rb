class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :bid, Auction do |auct|
      user != auct.user
    end

    cannot :bid, Auction do |auct|
      user == auct.user
    end

  end
end
