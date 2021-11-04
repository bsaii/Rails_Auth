class TweetsController < ApplicationController
    #make sure the user is logged in
    before_action :reqiure_user_logged_in!
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    
    def index
       @tweets = Current.user.tweets 
    end  

    def new
        @tweet = Tweet.new
    end
    
    def create 
        @tweet = Current.user.tweets.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path, notice: "Your Tweet was scheduled successfully"
        else
            render :new
        end
    end

    #to load the editing page
    def edit 

    end

    #to update the tweet in the db    
    def update
        if @tweet.update(tweet_params)
            redirect_to tweets_path, notice: "Your Tweet was updated successfully"
        else
            render :edit
        end
    end

    #to delete a tweet 
    def destroy
        @tweet.destroy
        redirect_to tweets_path, alert: "Your Tweet was unscheduled"
    end
    
    


    private

    def tweet_params
        params.require(:tweet).permit(:twitter_account_id, :body, :published_at)
    end
    
    def set_tweet
        @tweet = Current.user.tweets.find(params[:id])
    end
    
end