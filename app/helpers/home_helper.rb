module HomeHelper

  def other_users
    User.where.not(id: current_user.id)
  end

  def my_quest
    Quest.find_by(created_by: current_user, available: true)
  end

  def other_quests
    Quest.where.not(created_by: current_user).where(available: true)
  end

  def points_options
    [1, 3, 5]
  end
end
