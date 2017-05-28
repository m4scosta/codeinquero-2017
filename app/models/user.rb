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

  def first_name
    self.name.to_s[/\A[[:space:]]*(?<first_name>[[:graph:]]+)/, :first_name]
  end

  def last_name
    self.name.to_s[/[[:space:]]+(?<last_name>[[:print:]]*)/, :last_name] || ''
  end

  def initials
    "#{first_name.first} #{last_name.first}"
  end
end
