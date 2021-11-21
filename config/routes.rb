Rails.application.routes.draw do
  
  # Routes for the Restaurant resource:

  # CREATE
  post("/insert_restaurant", { :controller => "restaurants", :action => "create" })
          
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

  get("/", { :controller => "home", :action => "homepage" }) 

end