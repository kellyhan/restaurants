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
  belongs_to(:user, { :required => true, :class_name => "Users", :foreign_key => "user_id" })

  def restaurant_user
    return Users.where({ :id => self.user_id }).at(0)
  end
end
