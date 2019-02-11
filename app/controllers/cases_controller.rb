class CasesController < ApplicationController
    before_action :find_case, only:[:show, :edit, :update, :destroy]
    before_action :get_organization, only:[:index, :show, :update, :destroy]

    def index
        @cases = Case.all.order("created_at DESC").where({organization_id: @org.id})
    end

    def new
        @case = current_user.case.build
        @categories = Category.pluck(:name, :id)
    end

    def create
        @case = current_user.case.build(case_params)
        @case.category_id = params[:category_id]
        instances =  Case.where(category_id: params[:category_id]).count
        @case.organization_id = @org.id

        @case.title = '#{@case.category_id}' + "-" + instances.to_s
        if @case.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def show
        @case = Case.find(params[:id])
    end

    def edit
        @categories = Category.all.map { |c| [c.name,c.id] }
    end

    def update
        @case.category_id = params[:category_id]
        if @case.update(case_params)
            redirect_to case_path(@case)
        else
            render 'edit'
        end
    end

    def destroy
        @case.destroy
        redirect_to root_path
    end 

    private 
    def case_params
        params.require(:case).permit!(:title, :name, :address, :contact, :cnic, :verifierPreference, :description, :category_id)
    end

    def find_case
        @case = Case.find(params[:id])
    end

    def get_organization
        @org = Organization.with_role(:user, current_user).first
    end

end
