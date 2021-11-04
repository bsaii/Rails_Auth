class PasswordResetsController < ApplicationController
    def new 

    end

    def create 
        @user = User.find_by(email: params[:email])

        #if user exits
        if @user.present?
            #send an email
            PasswordMailer.with(user: @user).Reset.deliver_now #or deliver_later

            redirect_to root_path, notice: "Check your email to reset password"
        else
            redirect_to root_path, alert: "email is not registered"
        end
    end

    def edit 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        #the token has expired
        rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, notice: "Your token has expired"
    end

    def update 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset successfully, Please sign in."
        else
            render :edit
        end

        private

        def password_params
           params[:user].permit(:password, :password_confirmation) 
        end
        
    end
end