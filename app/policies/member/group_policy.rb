class Member::GroupPolicy < Member::ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  # record 에는 [:member, @group] 이렇게 들어 있음
  def join?
    user.has_role? :prime
  end

  def show?

  end

  def my_index_show?
    user.has_role? :prime && record[1].users.include?(user)
  end

end
