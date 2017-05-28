class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :prizes

  # received_points is the total received since user created
  # available_points are the amount available to exchange for prizes

  # TODO: implementar frozen points

  validates :points_to_give, numericality: { only_integer: true, greater_than: 0 }
  validates :received_points, numericality: { only_integer: true }
  validates :available_points, numericality: { only_integer: true }

  scope :most_rewarded_first, -> { order(received_points: :desc) }

  def increase_points(points)
    self.received_points += points
    self.available_points += points
    self.save!
  end

  def decrease_points_to_give(points)
    self.points_to_give -= points
    self.save!
  end

  def decrease_available_points!(points)
    self.available_points -= points
    self.save!
  end

  def can_give?(points)
    self.points_to_give >= points
  end

  def can_redeem?(points)
    self.available_points >= points
  end

  def first_name
    self.name.to_s[/\A[[:space:]]*(?<first_name>[[:graph:]]+)/, :first_name]
  end

  def last_name
    self.name.to_s[/[[:space:]]+(?<last_name>[[:print:]]*)/, :last_name] || ''
  end

  def at_name
    '@' + name.split(' ').join('.').downcase
  end

  def initials
    unless last_name.blank?
      "#{first_name.first}#{last_name.first}"
    else
      "#{first_name[0..1]}"
    end
  end

  def choose_prize(prize)
    if self.can_redeem?(prize.cost)
      self.prizes << prize
      self.decrease_available_points!(prize.cost)
      true
    end
  end
end
