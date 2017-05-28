class QuestReward < ApplicationRecord
  belongs_to :quest
  belongs_to :rewarded_user, class_name: 'User'

  scope :newest_first, -> { order(created_at: :desc) }

  def start_user
    return self.quest.created_by
  end

  def description
    self.quest.description
  end

  def total_points
    self.quest.reward_points
  end
end
