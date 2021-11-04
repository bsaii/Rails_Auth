class TwitterAccountsController < ApplicationController
    #user should be logged in
    before_action :reqiure_user_logged_in!
    before_action :set_twitter_account, only: [ :destory] #this before action will be called only for the data in the array and nothing else

    def index 
        @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
        @twitter_accounts.destroy
        
        #redirect
        redirect_to twitter_accounts_path, notice: "Successfully disconnected @#{@twitter_accounts.username}"
    end
    
    private

    def set_twitter_account
        @twitter_accounts = Current.user.twitter_accounts.find(params[:id])
    end
    
end