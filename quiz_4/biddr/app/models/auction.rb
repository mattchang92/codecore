class Auction < ApplicationRecord
  belongs_to :user

  has_many :bids, dependent: :destroy

  include AASM

    aasm whiny_transitions: false do
      state :draft, initial: true
      state :published
      state :canceled
      state :won
      state :reserve_met
      state :reserver_unmet

      event :publish do
        transitions from: :draft, to: :published
      end

      event :reserve_succeed do
        transitions from: :published, to: :reserve_met
      end

      event :reserve_fail do
        transitions from: :published, to: :reserve_unmet
      end

      event :cancel do
        transitions from: [:published, :reserve_met, :won], to: :canceled
      end

      event :complete do
        transitions from: [:reserve_met, :reserve_unmet], to: :won
      end

  end


end
