class Quest < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :rewards, class_name: 'QuestReward'
end
