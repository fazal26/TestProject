class OrganizationsController < ApplicationController
    def index
    end
    def new
        @org = Organization.new
    end

    def create
        @org = Organization.new(org_params)
        @user = User.new({email: @org.admin_email, password: '112233'})
        @user.add_role(:admin)
        if @org.save
            flash.now[:notice] = 'Company Created!'
            if @user.save
                flash.now[:notice] = 'Admin Created and Mail Sent!'
                UserMailer.welcome_email(@org.admin_email).deliver_now
                redirect_to root_path
            else
                flash.now[:notice] = 'Error Creating Admin!'
            end
        else
            flash.now[:notice] = 'Error Creating Company or Admin!'
            render 'new'
        end
    end

    private 
    def org_params
        params.require(:organization).permit!()
    end

end
