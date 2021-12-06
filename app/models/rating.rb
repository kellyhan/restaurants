# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  rate          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#  user_id       :integer
#
class Rating < ApplicationRecord

  def user
    return Users.where({ :id => self.user_id }).at(0)
  end

end
