class User < ApplicationRecord

  # received_points is the total received since user created
  # available_points are the amount available to exchange for prizes

  # TODO: implementar frozen points

  before_validation :set_defaults

  validates :client_id, presence: true
  validates :points_to_give, numericality: { only_integer: true, greater_than: 0 }
  validates :received_points, numericality: { only_integer: true }
  validates :available_points, numericality: { only_integer: true }

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

  private

  def set_defaults
    self.points_to_give = 100
    self.received_points = 0
    self.available_points = 0
  end
end
