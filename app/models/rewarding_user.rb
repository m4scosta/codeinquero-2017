class RewardingUser < ApplicationRecord
  belongs_to :user
  belongs_to :user_reward

  validates :points, numericality: { only_integer: true, greater_than: 0 }
end
