class HomeController < ApplicationController
  def load_current_user
    the_id = session.fetch(:user_id)

    @current_user = Users.where({ :id => the_id }).at(0)
  end
  
  def homepage
    render({ :template => "home/homepage.html.erb" })
  end

end