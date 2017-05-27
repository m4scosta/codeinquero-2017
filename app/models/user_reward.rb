class UserReward < ApplicationRecord
  belongs_to :rewarded_user, class_name: 'User'
  has_many :rewarding_users
end
