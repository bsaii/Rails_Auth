class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.Reset.subject
  #
  def Reset
    #signed_id generates a token to be added to the url to direct the user to reset the password
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 10.minutes)

    mail to: params[:user].email
  end
end
