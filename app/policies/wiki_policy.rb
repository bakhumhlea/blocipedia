class WikiPolicy < ApplicationPolicy
    def create?
        user.admin? or user.premium?
    end
    
    def destroy?
        user.admin? or record.user == user
    end
end