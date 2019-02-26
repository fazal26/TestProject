class OptinsController < ApplicationController

    def create
        Optin.create!(optin_params)
        redirect_to cases_path
    end

    private 
    def optin_params
        params.require(:optin).permit(:user_id, :case_id)
    end
end
