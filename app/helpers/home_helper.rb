module HomeHelper

  def other_users
    User.where.not(id: current_user.id)
  end

  def points_options
    [1, 3, 5]
  end
end
