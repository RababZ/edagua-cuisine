class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #scope.all
      user.admin ? scope.all : scope.where(email: user.email)
      #scope.all
      #scope.where(user: user).where(project.manager: user)
    end
  end

  def profile?
    true
  end

  def profile_update?
    profile?
  end

  def show?
    true
  end

end

