class UsersController < ApplicationController

    def new
     @user = User.new
    end

    def create
        @user = User.new()
        @user.email = params[:user][:email]
        @user.password = "111111"
        @user.organization_id = current_user.organization_id
        @user.save!()
        
    end



end
