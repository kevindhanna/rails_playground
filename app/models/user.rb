class User < ApplicationRecord
  validates :name, presence: true
  validates :email, format: /@/, presence: true, uniqueness: { case_sensitive: false }
end
