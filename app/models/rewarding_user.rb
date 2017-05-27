class RewardingUser < ApplicationRecord
  belongs_to :user
  belongs_to :user_reward
end
