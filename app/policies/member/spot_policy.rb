class Member::SpotPolicy < Member::ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  # record 에는 [:member, @spot] 이렇게 들어 있음
  def show?
    record[1].users.include?(user)
  end

end