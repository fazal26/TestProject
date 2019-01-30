class OrganizationsController < ApplicationController
    before_action :validate_superAdmin
    before_action :find_org, only: [:show, :destroy]

    def index
        @orgs = Organization.all.order("created_at DESC")
    end
    def new
        @org = Organization.new
    end

    def create
        @org = Organization.new(org_params)
        @user = User.new({email: @org.admin_email, password: '112233'})
        
        @user.add_role(:admin)
        if @org.save
            flash[:notice] = 'Company Created!'
            @user.organization_id = @org.id
            if @user.save
                flash[:notice] = 'Admin Created and Mail Sent!'
                UserMailer.welcome_email(@org.admin_email).deliver_now
                redirect_to root_path
            else
                flash[:notice] = 'Error Creating Admin!'
            end
        else
            flash[:notice] = 'Error Creating Company!'
            render 'new'
        end
    end
    def show
    end

    def destroy
        User.where(organization_id: @org.id).destroy_all
        @org.destroy
        redirect_to organizations_path
    end


    private 
    def org_params
        params.require(:organization).permit!()
    end

    def find_org
        @org = Organization.find(params[:id])
    end


    def validate_superAdmin
        
        return true if current_user.has_role?(:super)
        
        redirect_to root_path
        flash[:notice] = 'Get the *uck Outta Here!'
    end


end
