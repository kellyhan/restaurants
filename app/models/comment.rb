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
    return Users.where({ :id => self.user_id }).at(0)
  end

  def restaurant
    return Users.where({ :id => self.restaurant_id }).at(0)
  end

end
