# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FactoryBot.define do
  factory :location do
    sequence :name, ['London', 'Berlin', 'Paris', 'Sydney', 'Glasgow'].cycle
    sequence :country, ['UK', 'Germany', 'France', 'Australia', 'Glasgow'].cycle
  end
end

locations = 5.times.map { FactoryBot.build(:location) }

FactoryBot.define do
  factory :band do
    location { build(:location) }
    name { "#{owner.name}s #{location.name} Band" }
    owner { build(:user, location: location) }
    members do
      rand(1..4).times.map { build(:user, location: location)}
    end
  end
end

FactoryBot.define do
  factory :user do
    location { build(:location) }
    sequence(:name) { |n| "#{location.name} User #{n}" }
    sequence(:email) { |n| "#{location.name}.user.#{n}@bands.com" }
  end
end

bands = locations.map { |l| FactoryBot.build(:band, location: l) }
bands.map(&:save)
