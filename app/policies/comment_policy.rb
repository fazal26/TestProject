class CommentPolicy < ApplicationPolicy


    
      def create?
        !is_admin_or_verifier
      end
    
      def new?
        create?
      end

      def destroy?
        !is_admin_or_verifier
      end

      end
    
      private 
      def is_admin_or_verifier
        puts "OOOOOOOOOOOOOOOOOO\n"*99
        puts user.has_role?(:super) || user.has_role?(:user, Organization.with_role(:user, current_user))
      end



end