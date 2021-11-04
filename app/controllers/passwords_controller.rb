class PasswordsController < ApplicationController
    before_action :reqiure_user_logged_in!

    def edit
        
    end
    
    #to update the password in the db
    def update
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password Updated!"
        else
            render :edit #render the edit page
        end
    end

    private #helper function below

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
    
    
end