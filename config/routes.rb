Rails.application.routes.draw do
  
  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Rating resource:

  # CREATE
  post("/insert_rating", { :controller => "ratings", :action => "create" })
          
  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  
  get("/ratings/:path_id", { :controller => "ratings", :action => "show" })
  
  # UPDATE
  
  post("/modify_rating/:path_id", { :controller => "ratings", :action => "update" })
  
  # DELETE
  get("/delete_rating/:path_id", { :controller => "ratings", :action => "destroy" })

  #------------------------------

  # Routes for the Dish resource:

  # CREATE
  get("/insert_picture", { :controller => "pictures", :action => "create_dish" })
  post("/create_picture", { :controller => "pictures", :action => "create" })     
          
  # READ
  get("/pictures", { :controller => "pictures", :action => "index" })
  
  get("/pictures/:path_id", { :controller => "pictures", :action => "show" })
  
  # UPDATE
  
  post("/modify_picture/:path_id", { :controller => "pictures", :action => "update" })
  
  # DELETE
  get("/delete_picture/:path_id", { :controller => "pictures", :action => "destroy" })

  #------------------------------

  # Routes for the Cuisine resource:

  # CREATE
  get("/insert_cuisine", { :controller => "cuisines", :action => "create_cuisine" })
  post("/create_cuisine", { :controller => "cuisines", :action => "create" })        
          
  # READ
  get("/cuisines", { :controller => "cuisines", :action => "index" })
  
  get("/cuisines/:path_id", { :controller => "cuisines", :action => "show" })
  
  # UPDATE
  
  post("/modify_cuisine/:path_id", { :controller => "cuisines", :action => "update" })
  
  # DELETE
  get("/delete_cuisine/:path_id", { :controller => "cuisines", :action => "destroy" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/insert_restaurant", { :controller => "restaurants", :action => "create_restaurant" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create" })        

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  
  get("/restaurants/:path_id", { :controller => "restaurants", :action => "show" })
  
  # UPDATE
  
  post("/modify_restaurant/:path_id", { :controller => "restaurants", :action => "update" })
  
  # DELETE
  get("/delete_restaurant/:path_id", { :controller => "restaurants", :action => "destroy" })

  #------------------------------

# Routes for the User account:

  #VIEW ALL USERS
  get("/users", { :controller => "users", :action => "index" })

  #READ
  get("/users/:path_id", { :controller => "users", :action => "show_restaurants" })
  get("/user_details/:path_id", { :controller => "users", :action => "show" })

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "users", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "users", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "users", :action => "destroy_cookies" })
             
  #------------------------------

  get("/", { :controller => "restaurants", :action => "index" })

end
