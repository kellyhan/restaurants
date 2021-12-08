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

  def restaurant
    return Restaurant.where({ :id => self.restaurant_id }).at(0)
  end

  def user
    return Users.where({ :id => self.user_id }).at(0)
  end

end
