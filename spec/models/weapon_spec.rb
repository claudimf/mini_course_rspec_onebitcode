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
require 'rails_helper'

RSpec.describe Weapon, type: :model do
  context 'Using FFaker + FactoryBot Gems ' do
    it 'is invalid if the level is not greater than zero' do
      weapon = build(:weapon, level: 0)
      expect(weapon).to_not be_valid
    end

    it 'weapon need to have name' do
      weapon = build(:weapon, name: nil)
      expect(weapon).to_not be_valid
    end

    it 'weapon need to have description' do
      weapon = build(:weapon, description: nil)
      expect(weapon).to_not be_valid
    end

    it 'check method current_power' do
      weapon = build(:weapon)
      value = (weapon.power_base + ((weapon.level - 1) * weapon.power_step))
      expect(weapon.current_power).to eq(value)
    end

    it 'when weapon is on level 1, needs to have 3000 hp' do
      weapon = build(:weapon, level: 1)
      expect(weapon.current_power).to eq(3000)
    end

    it 'when weapon is on level 2, needs to have 3100 hp' do
      weapon = build(:weapon, level: 2)
      expect(weapon.current_power).to eq(3100)
    end
  end
end
