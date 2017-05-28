class Prize < ApplicationRecord
	has_and_belongs_to_many :users

  scope :available, -> { where('quantity > 0') }

end
