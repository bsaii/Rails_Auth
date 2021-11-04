class OmniauthCallbacksController < ApplicationController
    def twitter
        # Rails.logger.info auth #to log the info in the rails console

        # To prevent duplicate, so if there is a user with the nickname, update the details
        #####NOTE: THIS WORKS WHEN YOU ARE SIGNED IN. 
        #The app is to allow us to use our twitter account to do stuff not to sign in or sign up
        twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
        twitter_account.update(
            name: auth.info.name,
            # username: auth.info.nickname,
            image: auth.info.image,
            token: auth.credentials.token,
            secret: auth.credentials.secret,
        )

        #redirect
        redirect_to twitter_accounts_path, notice: "Successfully connected your Twitter account"
    end

    #required - hash of credentials from twitter set by omniauth
    def auth
        request.env['omniauth.auth']
    end
    
end