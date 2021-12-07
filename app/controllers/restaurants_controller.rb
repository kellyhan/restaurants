class RestaurantsController < ApplicationController
  def index
    matching_restaurants = Restaurant.all

    @list_of_restaurants = matching_restaurants.order({ :created_at => :desc })

    @list_of_restaurants.each do |a_restaurant|
      a_restaurant.rating = a_restaurant.ave_ratings
      #a_restaurant.restaurant_comments = a_restaurant.restaurant_comments
    end

    render({ :template => "restaurants/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_restaurants = Restaurant.where({ :id => the_id })

    @the_restaurant = matching_restaurants.at(0)
    @the_restaurant.rating = @the_restaurant.ave_ratings
    #@the_restaurant.restaurant_comments = @the_restaurant.restaurant_comments

    render({ :template => "restaurants/show.html.erb" })
  end

  def create_restaurant

    render({ :template => "restaurants/create.html.erb" })
  end

  def create
    the_restaurant = Restaurant.new
    the_restaurant.name = params.fetch("query_name")
    the_restaurant.address = params.fetch("query_address")
    the_restaurant.cuisine_id = params.fetch("query_cuisine")
    the_restaurant.user_id = @current_user.id
    the_restaurant.rating = params.fetch("query_rating")

    #the_comment = Comment.new
    #the_comment.text = params.fetch("query_comments")
    #the_comment.user_id = @current_user.id
    #the_comment.restaurant_id = the_restaurant.id
    #the_comment.save
    #the_restaurant.restaurant_comments = the_restaurant.restaurant_comments + " " + the_comment.text

    if the_restaurant.valid?
      the_restaurant.save
      redirect_to("/restaurants", { :notice => "Restaurant created successfully." })
    else
      redirect_to("/restaurants", { :alert => the_restaurant.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_restaurant = Restaurant.where({ :id => the_id }).at(0)

    the_restaurant.name = params.fetch("query_name")
    the_restaurant.address = params.fetch("query_address")
    the_restaurant.cuisine_id = params.fetch("query_cuisine")
    the_restaurant.user_id = @current_user.id

    the_rating = Rating.new
    the_rating.rate = params.fetch("query_rating")
    the_rating.user_id = @current_user.id
    the_rating.restaurant_id = the_restaurant.id
    the_rating.save
    the_restaurant.rating = the_restaurant.ave_ratings

    #the_comment = Comment.new
    #the_comment.text = params.fetch("query_comments")
    #the_comment.user_id = @current_user.id
    #the_comment.restaurant_id = the_restaurant.id
    #the_comment.save
    #the_restaurant.restaurant_comments = the_restaurant.restaurant_comments + " " + the_comment.text

    if the_restaurant.valid?
      the_restaurant.save
      redirect_to("/restaurants/#{the_restaurant.id}", { :notice => "Restaurant updated successfully."} )
    else
      redirect_to("/restaurants/#{the_restaurant.id}", { :alert => "Restaurant failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_restaurant = Restaurant.where({ :id => the_id }).at(0)

    the_restaurant.destroy

    redirect_to("/restaurants", { :notice => "Restaurant deleted successfully."} )
  end
end
