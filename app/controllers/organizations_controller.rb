class OrganizationsController < ApplicationController
    before_action :validate_superAdmin
    before_action :find_org, only: [:show, :destroy,:edit,:update]

    def index
        @orgs = Organization.all.order("created_at DESC")
    end
    def new
        @org = Organization.new
    end

    def create
        if OrganizationCreator.new(params).perform
            flash[:notice] = 'Organization Created!' 
        else
            flash[:notice] = 'Error Creating Organization!'
            render 'new'
        end

    end

    def edit; end
    
    def update
        if @org.update(org_params)
            redirect_to organization_path(@org)
        else
            render 'edit'
        end
    end

    def show; end

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
