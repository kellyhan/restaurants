# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  address    :text
#  name       :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer
#  cuisine_id :integer
#  user_id    :integer
#
class Restaurant < ApplicationRecord
  validates :name, :presence => true
  validates :address, :presence => true
  validates :user_id, :presence => true

  belongs_to(:user, { :required => true, :class_name => "Users", :foreign_key => "user_id" })
  belongs_to(:cuisine, { :required => true, :class_name => "Cuisine", :foreign_key => "cuisine_id" })

  def user_restaurant_count
    return Users.where({ :id => self.user_id }).count
  end

  def restaurant_user
    return Users.where({ :id => self.user_id }).at(0)
  end

  def cuisine
    return Cuisine.where({ :id => self.cuisine_id }).at(0)
  end

  def list_of_ratings
    return Rating.where({ :restaurant_id => self.id })
  end

  def ave_ratings
    matching_ratings = Rating.where({ :restaurant_id => self.id })

    sum_array = Array.new
    matching_ratings.all.each do |a_rating|
      new_rate = a_rating.rate.to_f
      sum_array << new_rate
    end

    if matching_ratings.count != 0
      average_ratings = (sum_array.sum / matching_ratings.count).to_f
    else
      average_ratings = sum_array.sum
    end
    
    return average_ratings
  end

end
