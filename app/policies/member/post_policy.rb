class Member::PostPolicy < Member::ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  # record 에는 [:member, @post] 이렇게 들어 있음

end
