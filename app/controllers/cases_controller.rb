class CasesController < ApplicationController
    before_action :find_case, only:[:show, :edit, :update, :destroy, :comment, :verification]
    before_action :get_organization, only:[:index, :create, :show, :update, :destroy]
    before_action :get_categories, only:[:new, :create, :edit]

    def index
        @cases = Case.all.order("created_at DESC").where({organization_id: @org.id}) if @org.present?
        @opt = Optin.new
    end

    def new
        @case = current_user.cases.build
        authorize @case
    end

    def create
        @case = current_user.cases.build(case_params)
        @case.category_id = params[:case][:category_id]
        instances =  Case.where(category_id: params[:case][:category_id]).count + 1
        @case.organization_id = @org.id
        @case.title = Category.find(params[:case][:category_id]).name + "-" + instances.to_s
        admin = User.with_role(:admin, @org).first
        if @case.save
            # UserMailer.case_add_email(admin.email, current_user.id, @case.id).deliver_now
            redirect_to cases_path
        else
            render 'new'
        end

    end
    
    def show
        @comments = @case.comments.where({parent_id: nil})
        @comment = Comment.new
    end

    def edit
    authorize @case
    end


    def verification
        @verification  = Verification.new({case_id: params[:id]})
        authorize @verification
    end

    def update

        if status_params[:status].present?
            @case = Case.find(status_params[:id])
            @case.status = Case.statuses[status_params[:status]]
            authorize @case 
            @case.save!
        else
            instances =  Case.where(category_id: params[:case][:category_id]).count + 1
            @case.title = Category.find(params[:case][:category_id]).name + "-" + instances.to_s
            @case.update!(case_params)
        end
        redirect_to root_path
    end

    def destroy
        @case.destroy!
        redirect_to manage_case_path
    end 

    def home; end

    private 
    def case_params
        params.require(:case).permit(:name, :address, :contact, :cnic, :verifierPreference, :description, :category_id, files:[])
    end

    def status_params
        params.permit(:status, :id)
    end

    def find_case
        @case = Case.find(params[:id])
    end

    def get_organization
        @org = Organization.with_roles([:admin, :user, :verifier], current_user).first
    end

    def get_categories
        @categories = Category.pluck(:name, :id)
    end

end
