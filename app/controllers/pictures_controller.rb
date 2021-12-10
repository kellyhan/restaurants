class PicturesController < ApplicationController
  def load_current_user
    the_id = session.fetch(:user_id)

    @current_user = Users.where({ :id => the_id }).at(0)
  end
  
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
    @the_dish = Dish.new
    @the_dish.name = params.fetch("query_name")
    @the_dish.image = params.fetch(:image)
    @the_dish.restaurant_id = params.fetch("query_restaurant")
    @the_dish.user_id = @current_user.id

    if @the_dish.valid?
      @the_dish.save
      redirect_to("/pictures", { :notice => "Dish created successfully." })
    else
      redirect_to("/pictures", { :notice => "Dish failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_dish = Dish.where({ :id => the_id }).at(0)

    @the_dish.name = params.fetch("query_name")
    @the_dish.image = @the_dish.image
    @the_dish.restaurant_id = params.fetch("query_restaurant")
    @the_dish.user_id = @current_user.id

    if @the_dish.valid?
      @the_dish.save
      redirect_to("/pictures", { :notice => "Dish updated successfully."} )
    else
      redirect_to("/pictures/#{@the_dish.id}", { :alert => "Dish failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dish = Dish.where({ :id => the_id }).at(0)

    the_dish.destroy

    redirect_to("/pictures", { :notice => "Dish deleted successfully."} )
  end
end
