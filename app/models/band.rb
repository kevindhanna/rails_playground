class Band < ApplicationRecord
  belongs_to :location
  belongs_to :owner, class_name: 'User'
  has_many :members, through: :memberships
end
