class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  #validation
  validates :body, length: {minimum: 1, maximum: 280}
  validates :published_at, presence: true

  #after it is in memory or initializes, set default values
  after_initialize do 
    #set the default value of the publish at
    self.published_at ||= 24.hours.from_now
  end

  #if the tweet is published
  def published?
    tweet_id? #to check if there is a tweet_id and return boolean
  end
  
end
