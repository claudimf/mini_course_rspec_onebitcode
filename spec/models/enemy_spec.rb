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
  pending "add some examples to (or delete) #{__FILE__}"
end
