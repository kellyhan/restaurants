class ApplicationController < ActionController::Base
  # before_action(:force_user_sign_in)
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :alert => "You have to sign in first." })
    end
  end

  before_action(:load_current_user)
  def load_current_user
    @current_user = Users.where({ :id => session.fetch(:user_id) }).at(0)
  end

end
