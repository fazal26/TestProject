class CasesController < ApplicationController
    before_action :find_case, only:[:show, :edit, :update, :destroy, :comment]
    before_action :get_organization, only:[:index, :create, :show, :update, :destroy]
    before_action :get_categories, only:[:new, :create, :edit]

    def index
        @cases = Case.all.order("created_at DESC").where({organization_id: @org.id})
    end

    def new
        @case = current_user.cases.build
    end

    def create
        @case = current_user.cases.build(case_params)
        @case.category_id = params[:case][:category_id]
        instances =  Case.where(category_id: params[:case][:category_id]).count + 1
        @case.organization_id = @org.id
        @case.title = Category.find(params[:case][:category_id]).name + "-" + instances.to_s

        if @case.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def show; end

    def edit; end

    def comment
        @comments = @case.comments
        @comment = Comment.new
    end

    def update
        @case = Case.find(status_params[:id])
        @case.status = Case.statuses[status_params[:status]]
        @case.save!
    end

    def destroy
        @case.destroy
        redirect_to root_path   #route back
    end 

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
        @org = Organization.with_roles([:admin, :user], current_user).first
    end

    def get_categories
    @categories = Category.pluck(:name, :id)
    end

end
