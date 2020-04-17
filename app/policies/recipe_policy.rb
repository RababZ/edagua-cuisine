class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true # Anyone that is logged in can create a recipe
  end

  def show?
    return true
  end
end
