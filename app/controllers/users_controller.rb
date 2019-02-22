class UsersController < ApplicationController
    before_action :get_user, only:[:destroy, :show]

    def index; end

    def new
     @user = User.new
    end

    def create

        # generated_password = Devise.friendly_token.first(8)
        @user = User.create!({email: user_params[:email],username: user_params[:username] ,password: '111111'})
        # @user.invite!()
        if user_params[:role] == "verifier"
            @user.add_role :verifier, Organization.with_role(:admin, current_user).first
        elsif user_params[:role] == "user"
            @user.add_role :user, Organization.with_role(:admin, current_user).first        
        end
        @user.save!
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private 
    def user_params
        params.require(:user).permit(:email, :username, :role)
    end

    def get_user
        @user = User.find(params[:id])
    end


end
