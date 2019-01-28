class ApplicationController < ActionController::Base
    include Pundit

    def after_sign_in_path_for(resource)
     puts "(((((((((((((((((("*100
     puts resource.inspect
     puts "(((((((((((((((((("*100
    # new_case_path and return
    end
end
