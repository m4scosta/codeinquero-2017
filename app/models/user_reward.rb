class UserReward < ApplicationRecord
  belongs_to :rewarded_user, class_name: 'User'
  has_many :rewarding_users

  scope :newest_first, -> { order(created_at: :desc) }

  def start_user
    self.rewarding_users.find_by(started: true).user
  end

  def total_points
    self.rewarding_users.pluck(:points).sum
  end

  def self.reward(from:, to:, description:, points:)
    if points > 0 && from.can_give?(points)
      reward = create(description: description, rewarded_user: to)
      from.decrease_points_to_give(points)
      to.increase_points(points)
      RewardingUser.create(user_reward: reward, user: from, points: points, started: true)
      reward
    end
  end
end
