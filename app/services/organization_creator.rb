class OrganizationCreator
    def initialize(params)
        @params = params
        
    end

    def perform
        ActiveRecord::Base.transaction do
            puts '***org creator SERVICE****'*20
            puts @params.inspect
            org = Organization.create!(title: @params[:title])
            user = User.create!({email: @params[:email], password: @params[:password]})
            user.invite!()
            user.add_role :admin, org
            user.save!

        end
    end
end