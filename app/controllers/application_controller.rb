class ApplicationController < ActionController::Base
    #before any action, run set_current_user
    before_action :set_current_user

    #this is to allow us to have the session in every controller
    def set_current_user
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def reqiure_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that" if Current.user.nil?
    end  
end
