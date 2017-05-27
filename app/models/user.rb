class User < ApplicationRecord

  # received_points is the total received since user created
  # available_points are the amount available to exchange for prizes

  # TODO: implementar frozen points

  def increase_points(points)
    self.received_points += points
    self.available_points += points
    self.save!
  end

  def decrease_points_to_give(points)
    self.points_to_give -= points
    self.save!
  end

  def can_give?(points)
    self.points_to_give >= points
  end
end
