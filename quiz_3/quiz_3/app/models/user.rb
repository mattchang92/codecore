class User < ApplicationRecord
  has_secure_password

  has_many :ideas, dependent: :nullify
  has_many :likes, dependent: :nullify
  has_many :memberships, dependent: :destroy
  has_many :comments, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

end
