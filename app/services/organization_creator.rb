class OrganizationCreator
    def initialize(params)
        puts '***org creator SERVICE****'*20
        puts params.inspect
        @params = params
        
    end

    def perform
        ActiveRecord::Base.transaction do
            org = Organization.create!(@params)
            org.update!({admin_id: org.users.first.id})

            user = User.find(org.admin_id)
            user.invite!()
            user.add_role :admin, org
            user.save!

        end
    end
end