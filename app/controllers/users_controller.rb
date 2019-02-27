class UsersController < ApplicationController
    before_action :get_user, only:[:destroy, :show, :update, :edit]
    before_action :get_organization, only: [:update, :create, ]

    def index; end

    def edit; end

    def new
     @user = User.new
    end

    def create
        # generated_password = Devise.friendly_token.first(8)
        @user = User.create!({email: user_params[:email],username: user_params[:username] ,password: '111111'})
        # @user.invite!()
        if user_params[:role] == "verifier"
            @user.add_role :verifier, @org
        elsif user_params[:role] == "user"
            @user.add_role :user, @org       
        end
        @user.save!
        redirect_back(fallback_location: root_path)
    end

    def update
        @user.update!(edit_user_params)
        # role = role_params[:role].downcase
        # if role == "verifier"
        #     @user.remove_role(:user, @org )
        #     @user.add_role(:verifier, @org)
        # elsif
        #     @user.remove_role(:verifier, @org )        
        #     @user.add_role(:user, @org)
        # end
        @user.save!
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        redirect_to manage_user_path
    end

    private 
    def user_params
        params.require(:user).permit(:email, :username, :role)
    end

    def edit_user_params
        params.require(:user).permit(:username, :image)
    end

    def role_params
        params.permit(:id, :role)
    end

    def get_user
        @user = User.find(params[:id])
    end

    def get_organization
        @org = Organization.with_roles([:user, :verifier, :admin], current_user).first
    end


end
