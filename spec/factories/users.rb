# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  kind       :integer
#  level      :integer
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    nickname FFaker::Lorem.word
    level FFaker::Random.rand(1..99)
    kind %i[knight wizard].sample
  end
end
