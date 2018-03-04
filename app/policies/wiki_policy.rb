class WikiPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            if user.admin? || user.premium?
                scope.all
            else
                scope.where(private: false)
            end
        end
    end
    
    def create?
        user.admin? or user.premium?
    end
    
    def destroy?
        user.admin? or record.user == user
    end
end