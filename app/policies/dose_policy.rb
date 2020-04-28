class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
  # def user_is_owner_or_admin?
    # record.user == user
    # record.user == user || user.admin
  # end
end
