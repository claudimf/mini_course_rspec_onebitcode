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
    
  end
end
