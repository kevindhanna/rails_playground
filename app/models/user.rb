class User < ApplicationRecord
  validates :name, presence: true
  validates :email, format: /@/, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :location
  has_many :memberships, dependent: :destroy
  has_many :band_memberships, through: :memberships, source: :band
  has_many :bands, foreign_key: 'owner_id', dependent: :destroy
end
