class RestaurantsController < ApplicationController
  def index
    matching_restaurants = Restaurant.all

    @list_of_restaurants = matching_restaurants.order({ :created_at => :desc })

    render({ :template => "restaurants/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_restaurants = Restaurant.where({ :id => the_id })

    @the_restaurant = matching_restaurants.at(0)

    render({ :template => "restaurants/show.html.erb" })
  end

  def create_restaurant

    render({ :template => "restaurants/create.html.erb" })
  end

  def create
    the_restaurant = Restaurant.new
    the_restaurant.name = params.fetch("query_name")
    the_restaurant.address = params.fetch("query_address")
    the_restaurant.comments = params.fetch("query_comments")
    the_restaurant.user_id = @current_user.id

    cuisine_name = params.fetch("query_cuisine")
    list_of_cuisines = Cuisine.all
    if list_of_cuisines.count == 0
      the_cuisine = Cuisine.new
      the_cuisine.name = cuisine_name
      the_cuisine.save
      the_restaurant.cuisine_id = the_cuisine.id
    else
      list_of_cuisines.each do |a_cuisine|
        if a_cuisine.name == cuisine_name
          the_restaurant.cuisine_id = a_cuisine.id
        else
          the_cuisine = Cuisine.new
          the_cuisine.name = cuisine_name
          the_cuisine.save
          the_restaurant.cuisine_id = the_cuisine.id
        end
      end
    end
    

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
    the_restaurant.comments = params.fetch("query_comments")
    the_restaurant.user_id = @current_user.id

    cuisine_name = params.fetch("query_cuisine")
    list_of_cuisines = Cuisine.all
    if list_of_cuisines.count == 0
      the_cuisine = Cuisine.new
      the_cuisine.name = cuisine_name
      the_cuisine.save
      the_restaurant.cuisine_id = the_cuisine.id
    else
      list_of_cuisines.each do |a_cuisine|
        if a_cuisine.name == cuisine_name
          the_restaurant.cuisine_id = a_cuisine.id
        else
          the_cuisine = Cuisine.new
          the_cuisine.name = cuisine_name
          the_cuisine.save
          the_restaurant.cuisine_id = the_cuisine.id
        end
      end
    end

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
