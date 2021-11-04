class SessionsController < ApplicationController
    def destroy 
        session[:user_id] = nil

        redirect_to root_path, notice: "Logged Out"
    end

    #sign in page
    def new 

    end

    #sign in a user
    def create 
        user = User.find_by(email: params[:email])
        #if user exits
        if user.present? && user.authenticate(params[:password]) #authenticat is from has_secure_password(rails method)
            session[:user_id] = user.id 
            redirect_to root_path, notice: "Logged In Successfully"
        else
            flash[:alert] = "Invalid Email or Password"
            render :new #to render the signin page again
        end
    end
end