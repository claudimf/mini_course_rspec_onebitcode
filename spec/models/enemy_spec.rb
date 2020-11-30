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
require 'rails_helper'

RSpec.describe Enemy, type: :model do

  context 'Creating enemy' do
    it ' is invalid if the level is not between 1 an 99' do
      enemy = build(:enemy, level: FFaker::Random.rand(100..9999))
      expect(enemy).to_not be_valid
    end

    it "returns the correct enemy title" do
      name = FFaker::Lorem.word
      kind = %w[goblin orc demon dragon].sample
      level = FFaker::Random.rand(1..99)

      enemy = create(:enemy, name: name, kind: kind, level: level)
      expect(enemy.title).to eq("#{kind} #{name} ##{level}")
    end

    it 'check method current_power' do
      enemy = build(:enemy)
      value = (enemy.power_base + ((enemy.level - 1) * enemy.power_step))
      expect(enemy.current_power).to eq(value)
    end
  end
end
