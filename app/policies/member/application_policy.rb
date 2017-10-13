class Member::ApplicationPolicy < ApplicationPolicy
  def index?
    user.has_role? :member
  end

  def show?
    user.has_role? :member
  end

  def create?
    user.has_role? :member
  end

  def new?
    user.has_role? :member
  end

  def update?
    user.has_role? :member
  end

  def edit?
    user.has_role? :member
  end

  def destroy?
    user.has_role? :member
  end
end
