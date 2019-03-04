class UserMailer < ApplicationMailer

    def welcome_email(email)
        @email = email
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Welcome!')
    end

    def admin_update_email(email)
        @email = email
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Admin Update')
    end
    
    def admin_demoted_update_email(email)
        @email = email
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Admin Update')
    end

    def case_add_email(email, proposer_id, case_id)
        @proposer = User.find(proposer_id)
        @case = Case.find(case_id)
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Case Submission Notice')
    end

    def comment_notification_email(email, commenter_id, case_id)
        @commenter = User.find(commenter_id)
        @case = Case.find(case_id)
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Comment Notification')
    end

    def verification_notification_email(email, verifier_id, case_id)
        @verifier = User.find(verifier_id)
        @case = Case.find(case_id)
        @url  = 'http://localhost:3000/'
        mail(to: email, subject: 'Verification Notice')
    end

    def accept_invitation
        User.accept_invitation!(invitation_token: params[:invitation_token])
    end

end
