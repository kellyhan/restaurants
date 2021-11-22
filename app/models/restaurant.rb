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
#  cuisine_id :integer
#  user_id    :integer
#
class Restaurant < ApplicationRecord
  validates :name, :presence => true
  validates :address, :presence => true
  validates :user_id, :presence => true

  belongs_to(:user, { :required => true, :class_name => "Users", :foreign_key => "user_id" })
  belongs_to(:cuisine, { :required => true, :class_name => "Cuisine", :foreign_key => "cuisine_id" })

  def restaurant_user
    return Users.where({ :id => self.user_id }).at(0)
  end

  def cuisine
    return Cuisine.where({ :id => self.cuisine_id }).at(0)
  end
end
