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
    return User.where({ :id => self.user_id }).at(0)
  end

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:restaurant, { :required => true, :class_name => "Restaurant", :foreign_key => "restaurant_id" })

end
