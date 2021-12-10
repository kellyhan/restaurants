# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  text          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#  user_id       :integer
#
class Comment < ApplicationRecord

  def user
    return User.where({ :id => self.user_id }).at(0)
  end

  def restaurant
    return User.where({ :id => self.restaurant_id }).at(0)
  end

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:restaurant, { :required => true, :class_name => "Restaurant", :foreign_key => "restaurant_id" })

end
