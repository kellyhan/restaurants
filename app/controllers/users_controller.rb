class UsersController < ApplicationController
  # skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] 

  def index
    matching_users = Users.all
    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    @the_user = Users.where({ :id => params.fetch("path_id") }).at(0)

    render({ :template => "users/show.html.erb" })
  end
  
  def show_restaurants
    @the_user = Users.where({ :id => params.fetch("path_id") }).at(0)
    the_id = params.fetch("path_id")
    matching_restaurants = Restaurant.all.where(:user_id => the_id)
    @list_of_restaurants = matching_restaurants.order({ :created_at => :desc })

    render({ :template => "users/show_restaurants.html.erb" })
  end

  def sign_in_form
    render({ :template => "users/sign_in.html.erb" })
  end

  def create_cookie
    user = Users.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/user_sign_in", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "users/sign_up.html.erb" })
  end

  def create
    @user = Users.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")

    save_status = @user.save

    if save_status == true
      session[:user_id] = @user.id
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => @user.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @the_user = @current_user
    @the_user.password = params.fetch("query_password")
    @the_user.password_confirmation = params.fetch("query_password_confirmation")
    @the_user.first_name = params.fetch("query_first_name")
    @the_user.last_name = params.fetch("query_last_name")
    @the_user.username = params.fetch("query_username")
    
    if @the_user.valid?
      @the_user.save

      redirect_to("/users", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" , :alert => @the_user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account deleted." })
  end
 
end