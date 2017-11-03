class Member::ActivityPolicy < Member::ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  def join
    user.has_role? :prime and !record[1].full?
  end

  # record 에는 [:member, @activity] 이렇게 들어 있음
  def show?
    record[1].users.include?(user)
  end

end
