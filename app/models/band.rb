class Band < ApplicationRecord
  belongs_to :location
  belongs_to :owner, class_name: 'User'
end
