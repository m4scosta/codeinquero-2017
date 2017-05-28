class Quest < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :rewards, class_name: 'QuestReward'

  validates :reward_points, numericality: { only_integer: true, greater_than: 0 }

  def reward_user(rewarded_user)
    if self.created_by.can_give?(self.reward_points)
      QuestReward.create(quest: self, points: self.reward_points, rewarded_user: rewarded_user)
      rewarded_user.increase_points(self.reward_points)
      self.created_by.decrease_points_to_give(self.reward_points)
      self.available = false
      self.save
      true
    end
  end
end
