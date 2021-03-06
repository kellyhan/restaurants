# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cuisine < ApplicationRecord

  has_many(:restaurants, { :class_name => "Restaurant", :foreign_key => "cuisine_id" })

end
