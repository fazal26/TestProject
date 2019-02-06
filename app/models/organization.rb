class Organization < ApplicationRecord
    has_many :users

  #  after_create :assign_admin

    # def assign_admin
    #     @user = User.new({email: params[:admin_email], password: '112233'})
    #     @user.add_role(:admin)
    #     @user.organization_id = @org.id
    #     if @user.save
    #         flash[:notice] = 'Admin Created!'
    #         @org.admin_id = @user.id
    #         if @org.save
    #             flash[:notice] = 'Admin Assigned to Company!'
    #             redirect_to root_path
    #         else
    #             flash[:danger] = 'Error Assigning Admin!'
    #         end
    #     else
            
    #     end
    # end
end
