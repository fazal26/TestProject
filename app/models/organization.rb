class Organization < ApplicationRecord
    resourcify
    has_many :users, through: :roles, class_name: 'User', source: :users, dependent: :destroy
    has_many :cases, dependent: :destroy
    include ActiveModel::Dirty
    accepts_nested_attributes_for :users

    # after_update :update_admin


    def update_admin(admin_id, email)
        
        # Change Admin Roles
        # generated_password = Devise.friendly_token.first(8)
        admin = User.find(admin_id)
        org = Organization.with_role(:admin,admin)
        admin.remove_role(:admin, Organization.with_role(:admin,admin))
        admin.add_role(:user, org)
        new_admin = User.where({email: email})
        new_admin.remove_role(:user, org)
        new_admin.add_role(:admin, org)
        # UserMailer.admin_update_email(email, generated_password).deliver_now     
    end
end
