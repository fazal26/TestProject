class OrganizationsController < ApplicationController
    def index
    end
    def new
        @org = Organization.new
    end

    def create
        @org = Organization.new(org_params)
        if @org.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private 
    def org_params
        params.require(:organization).permit!()
    end

end
