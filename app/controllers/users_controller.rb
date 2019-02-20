class UsersController < ApplicationController
    before_action :get_user, only:[:destroy, :show]

    def index; end

    def new
     @user = User.new
    end

    def create
        # generated_password = Devise.friendly_token.first(8)
        @user = User.create!({email: user_params[:email], password: '111111'})
        # @user.invite!()
        @user.add_role :user, Organization.with_role(:admin, current_user).first
        @user.save!
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private 
    def user_params
        params.require(:user).permit(:email)
    end

    def get_user
        @user = User.find(params[:id])
    end


end
