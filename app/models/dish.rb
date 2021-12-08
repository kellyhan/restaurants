# == Schema Information
#
# Table name: dishes
#
#  id            :integer          not null, primary key
#  comments      :text
#  image         :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#
class Dish < ApplicationRecord

  mount_uploader :image, ImageUploader

  def restaurant
    return Restaurant.where({ :id => self.restaurant_id }).at(0)
  end

end
