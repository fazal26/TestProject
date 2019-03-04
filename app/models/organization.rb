class Organization < ApplicationRecord
    resourcify
    has_many :users, through: :roles, class_name: 'User', source: :users, dependent: :destroy
    has_many :cases, dependent: :destroy
    include ActiveModel::Dirty
    accepts_nested_attributes_for :users

    # after_update :update_admin


    def update_admin(admin_id, email, org)
        
        admin = User.find(admin_id)
        admin.remove_role(:admin, org)
        admin.add_role(:user, org)
        new_admin = User.where({email: email})
        if new_admin.empty?
            new_admin = User.create({email:email, password: '111111'})
            # new_admin.invite!()
        else
            new_admin = new_admin.first
            new_admin.remove_role(:user, org)
        end
        new_admin.add_role(:admin, org)
        admin.save!
        new_admin.save!
        UserMailer.admin_demoted_update_email(admin.email).deliver_now
        UserMailer.admin_update_email(email).deliver_now     
    end
end
