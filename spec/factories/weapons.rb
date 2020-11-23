# == Schema Information
#
# Table name: weapons
#
#  id          :bigint           not null, primary key
#  description :string
#  level       :integer          default(1)
#  name        :string
#  power_base  :integer          default(3000)
#  power_step  :integer          default(100)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :weapon do
    name FFaker::Lorem.word
    description FFaker::Lorem.word
  end
end
