class CasePolicy < ApplicationPolicy

    def index?
        !is_super
    end
    
      def show?
        false
      end
    
      def create?
        !is_super
      end
    
      def new?
        create?
      end
    
      def update?
        !is_super
      end
    
      def edit?
        update?
      end
    
      def destroy?
        !is_super
      end
      
      def comment?
        !is_super
        
      end

      def verification?
        !is_super

      end
    
      private 
      def is_super
        user.has_role?(:super)
      end



end