class User < ApplicationRecord

  has_secure_password

  has_many :bids, dependent: :destroy
  has_many :auctions, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end


end
