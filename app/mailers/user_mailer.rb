class UserMailer < ApplicationMailer
    def welcome_email(email)
        @email = email
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Welcome to My Awesome Site, Yabloi!')
    end
    def accept_invitation
        User.accept_invitation!(:invitation_token => params[:invitation_token])
    end

end
