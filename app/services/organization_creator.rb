class OrganizationCreator
    def initialize(params)
        puts '*******'*20
        puts params.inspect
        @title = params[:organization][:title]
        @admin_email = params[:admin_email]
    end

    def perform
        ActiveRecord::Base.transaction do
            org = Organization.create!({title: @title})
            user = User.create!({email: @admin_email, password: '112233', organization_id: org.id})
            user.add_role(:admin)
            user.save!
            org.admin_id = user.id
            org.save!
        end
    end
end