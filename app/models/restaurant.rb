# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  address    :text
#  comments   :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Restaurant < ApplicationRecord
end
