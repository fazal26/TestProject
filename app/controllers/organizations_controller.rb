class OrganizationsController < ApplicationController
    before_action :validate_superAdmin
    before_action :find_org, only: [:show, :destroy,:edit,:update]

    def index
        @orgs = Organization.all.order("created_at DESC")
    end
    def new
        @org = Organization.new
        @org.users.build
    end

    def create
        puts '&&&&&&&&&&&&&&&&&&&' * 10
        puts params.inspect
        org_params[:organization][:users_attributes]['0'][:password] = "112233"
        @org = Organization.new(org_params)

        if @org.save
            flash[:notice] = 'Organization Created!'
            redirect_to  organizations_path
        else
            flash[:error] = @org.errors.full_messages.join(', ')
            render 'new'
        end

    end

    def edit; end
    
    def update
        puts "*****************"*20
        puts org_params
        puts @org.persisted?
        puts @org.inspect

        @org.title = org_params[:title]
        @admin.email = org_params[:admin_email]
        if @org.update(org_params.except(:admin_email))
            if @admin.update
                flash[:notice] = 'Organization Update!'
                redirect_to organization_path(@org)
            else
                flash[:notice] = 'Error Updating Organization!'
            end
        else
            render 'edit'
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
        params.require(:organization).permit(:title, users_attributes:[:email])
    end
    def find_org
        @org = Organization.find(params[:id])
        @admin = User.find(@org.admin_id)
    end

    def validate_superAdmin
        return true if current_user.has_role?(:super)
        redirect_to root_path
        flash[:notice] = 'Get the *uck Outta Here!'
    end

   
end
