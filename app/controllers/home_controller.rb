class HomeController < ApplicationController
  def homepage
    render({ :template => "home/homepage.html.erb" })
  end

end