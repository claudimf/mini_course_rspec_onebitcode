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
class Enemy < ApplicationRecord
  enum kind: [:goblin, :orc, :demon, :dragon]
  validates :level, numericality: { greater_than: 0, less_than_or_equal_to: 99}
  validates :name, :power_base, :power_step, :level, :kind, presence: true

  def current_power
    (power_base + ((level - 1) * power_step))
  end

  def title
    "#{self.kind} #{self.name} ##{self.level}"
  end
end
