class CuisinesController < ApplicationController
  def index
    matching_cuisines = Cuisine.all
    @list_of_cuisines = matching_cuisines.order({ :created_at => :desc })

    render({ :template => "cuisines/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_cuisines = Cuisine.where({ :id => the_id })
    @the_cuisine = matching_cuisines.at(0)

    matching_restaurants = Restaurant.all.where(:cuisine_id => the_id)
    @list_of_restaurants = matching_restaurants.order({ :created_at => :desc })

    render({ :template => "cuisines/show.html.erb" })
  end

  def create_cuisine
    render({ :template => "cuisines/create.html.erb" })
  end

  def create
    the_cuisine = Cuisine.new
    the_cuisine.name = params.fetch("query_name")

    if the_cuisine.valid?
      the_cuisine.save
      redirect_to("/insert_restaurant", { :notice => "Cuisine created successfully." })
    else
      redirect_to("/insert_cuisine", { :notice => "Cuisine failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_cuisine = Cuisine.where({ :id => the_id }).at(0)

    the_cuisine.name = params.fetch("query_name")

    if the_cuisine.valid?
      the_cuisine.save
      redirect_to("/cuisines/#{the_cuisine.id}", { :notice => "Cuisine updated successfully."} )
    else
      redirect_to("/cuisines/#{the_cuisine.id}", { :alert => "Cuisine failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_cuisine = Cuisine.where({ :id => the_id }).at(0)

    the_cuisine.destroy

    redirect_to("/cuisines", { :notice => "Cuisine deleted successfully."} )
  end
end
