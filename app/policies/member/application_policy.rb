class Member::ApplicationPolicy < ApplicationPolicy
  def index?
    user.has_role? :memeber
  end

  def show?
    user.has_role? :memeber
  end

  def create?
    user.has_role? :memeber
  end

  def new?
    user.has_role? :memeber
  end

  def update?
    user.has_role? :memeber
  end

  def edit?
    user.has_role? :memeber
  end

  def destroy?
    user.has_role? :memeber
  end
end
