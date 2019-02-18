class UserMailer < ApplicationMailer

    def welcome_email(email)
        @email = email
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Welcome!')
    end

    def admin_update_email(email,new_password)
        @password = new_password
        @email = email
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Admin Update')
    end

    def accept_invitation
        User.accept_invitation!(:invitation_token => params[:invitation_token])
    end

end
