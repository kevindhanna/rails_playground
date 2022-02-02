class Band < ApplicationRecord
  belongs_to :location
  belongs_to :owner, class_name: 'User'
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  after_create :associate_owner

  def associate_owner
    memberships.create({ user: owner, band: self })
  end
end
