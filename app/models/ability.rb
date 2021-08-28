class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[index, show], BookReview, public: true
    can :search, :searches

    return unless user.present?

    can %i[new create edit update], BookReview, user: user

    can %i[follow unfollow], User

  end
end
