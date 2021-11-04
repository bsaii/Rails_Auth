#email: string
#password_digest: string

#from has_secure_password
#password: string
#password_confirmation: string

class User < ApplicationRecord
    has_many :twitter_accounts #to connect the twitter_accounts column and to interact with a user twitter account i.e. add new one, delete and edit
    has_many :tweets #to connect the tweets column
    
    has_secure_password #this is a method from ruby that runs the password through bcrypt and adds password confirmation

    #validation
    validates :email, presence: true
end

=begin
***to create a model
1. run rails generate model <model_name> <queries>
    e.g. rails generate model [User] [email:string password_digest:string]

2. run rails db:migrate
=end
