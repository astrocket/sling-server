class Manager::ApplicationPolicy < ApplicationPolicy
  def index?
    user.has_role? :manager
  end

  def show?
    user.has_role? :manager
  end

  def create?
    user.has_role? :manager
  end

  def update?
    user.has_role? :manager
  end

  def destroy?
    user.has_role? :manager
  end
end
