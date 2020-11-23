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
class User < ApplicationRecord
  enum kind: [:knight, :wizard]
  validates :level, numericality: { greater_than: 0, less_than_or_equal_to: 99}

  def title
    "#{self.kind} #{self.nickname} ##{self.level}"
  end
end
