module TimelineHelper

  def timeline
    user_rewards = UserReward.newest_first
    quest_rewards = QuestReward.newest_first
    (user_rewards + quest_rewards).sort_by { |r| r.created_at }.reverse!.take(20)
  end
end
