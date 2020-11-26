# == Schema Information
#
# Table name: enemies
#
#  id         :bigint           not null, primary key
#  kind       :integer
#  level      :integer
#  name       :string
#  power_base :integer
#  power_step :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :enemy do
    name { FFaker::Lorem.word }
    power_base { FFaker::Random.rand(1..9999) }
    power_step { FFaker::Random.rand(1..9999) }
    level { FFaker::Random.rand(1..99) }
    kind { %w[goblin orc demon dragon].sample }
  end
end
