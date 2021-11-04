#provides current details on every request made (rails feature)
#new user will have the current set to nil
#an existing user will have the current set to session[:user_id]

class Current < ActiveSupport::CurrentAttributes
    attribute :user
end