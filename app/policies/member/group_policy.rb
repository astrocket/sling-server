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

  # 정회원 업그레이드는 prime유저이고, 이미 그룹에 들어가 있어야하고, 그룹의 유료회원 쿼터가 꽉차지 않아야 한다.
  def upgrade?
    user.has_role? :prime and record[1].users.include?(user) and !record[1].full?
  end

  def my_index_show?
    user.has_role? :prime and record[1].users.include?(user)
  end

end
