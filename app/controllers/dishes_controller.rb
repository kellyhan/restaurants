class DishesController < ApplicationController
  def index
    matching_dishes = Dish.all

    @list_of_dishes = matching_dishes.order({ :created_at => :desc })

    render({ :template => "dishes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_dishes = Dish.where({ :id => the_id })

    @the_dish = matching_dishes.at(0)

    render({ :template => "dishes/show.html.erb" })
  end

  def create_dish
    render({ :template => "dishes/create.html.erb" })
  end

  def create
    the_dish = Dish.new
    the_dish.name = params.fetch("query_name")
    the_dish.image = params.fetch("query_image")
    the_dish.restaurant_id = params.fetch("query_restaurant_id")
    the_dish.comments = params.fetch("query_comments")

    if the_dish.valid?
      the_dish.save
      redirect_to("/dishes", { :notice => "Dish created successfully." })
    else
      redirect_to("/dishes", { :notice => "Dish failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_dish = Dish.where({ :id => the_id }).at(0)

    the_dish.name = params.fetch("query_name")
    the_dish.image = params.fetch("query_image")
    the_dish.restaurant_id = params.fetch("query_restaurant_id")
    the_dish.comments = params.fetch("query_comments")

    if the_dish.valid?
      the_dish.save
      redirect_to("/dishes/#{the_dish.id}", { :notice => "Dish updated successfully."} )
    else
      redirect_to("/dishes/#{the_dish.id}", { :alert => "Dish failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dish = Dish.where({ :id => the_id }).at(0)

    the_dish.destroy

    redirect_to("/dishes", { :notice => "Dish deleted successfully."} )
  end
end
