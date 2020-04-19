class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def my_recipes?
  #   return true
  # end

  def create?
    # Anyone that is logged in can create a recipe
    return true
  end

  def show?
    # Anyone that is logged in can see a recipe
    return true
  end

  def update?
    # User can edit and update if he/she create the recipe
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def user_is_owner_or_admin?
    record.user == user
    # record.user == user || user.admin
  end

end
