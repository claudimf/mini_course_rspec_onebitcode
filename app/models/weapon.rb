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
class Weapon < ApplicationRecord
  validates :level, numericality: { greater_than: 0}
  validates :name, :description, presence: true

  def current_power
    (power_base + ((level - 1) * power_step))
  end

  def title
    "#{self.name} ##{self.level}"
  end

end
