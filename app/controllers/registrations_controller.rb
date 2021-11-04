class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  # create a user in the database
  def create
    @user = User.new(user_params)
    # onSuccess
    if @user.save
      # sign in the user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully Created An Account'
    else
      render :new # the new.html.erb
    end
  end

  private # secure

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
