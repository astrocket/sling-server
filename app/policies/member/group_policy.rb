class Member::GroupPolicy < Member::ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.has_role? :prime
        scope
      else
        scope.where(premium: false)
      end
    end
  end

  def show?
    record.users.include?(user)
  end

end
