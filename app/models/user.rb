# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:restaurants, { :class_name => "Restaurant", :foreign_key => "user_id" })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "user_id" })
  has_many(:ratings, { :class_name => "Rating", :foreign_key => "user_id" })
  has_many(:dishes, { :class_name => "Dish", :foreign_key => "user_id" })

  validates :username, :presence => true
  validates :username, :uniqueness => { :case_sensitive => false }
  validates :first_name, :presence => true
  validates :last_name, :presence => true

end