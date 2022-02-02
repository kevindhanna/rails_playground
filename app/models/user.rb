class User < ApplicationRecord
  validates :name, presence: true
  validates :email, format: /@/, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :location
end
