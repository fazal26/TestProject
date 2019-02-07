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
        OrganizationCreator.new(org_params).perform
        redirect_to organizations_path
        # @org = Organization.new(org_params)

        #     flash[:notice] = 'Organization Created!'
        #     redirect_to  organizations_path
        # else
        #     flash[:notice] = '@org.errors.full_messages'
        #     render 'new'
        # end

    end

    def edit; end
    
    def update
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
        # generated_password = Devise.friendly_token.first(8)
        params[:organization][:users_attributes]["0"][:password]= '112233'
        params.require(:organization).permit(:title, users_attributes:[:email, :password])
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
