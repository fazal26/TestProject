class ApplicationController < ActionController::Base
    include Pundit

    # def after_sign_in_path_for(resource)
    #  puts "(((((((((((((((((("*100
    #  resource.next_step
    #  puts "(((((((((((((((((("*100
    # # new_case_path and return
    # end
    def after_sign_in_path_for(resource)
        if current_user.has_role?(:admin)
            new_organization_path
        elsif current_user.has_role?(:user)
         root_path
        else
         root_path
        end
       end
end
