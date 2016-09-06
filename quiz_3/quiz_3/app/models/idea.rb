class Idea < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :comments, dependent: :destroy

  def like_for(user)
    likes.find_by_user_id user
  end

  def membership_for(user)
    memberships.find_by_user_id user
  end

end
