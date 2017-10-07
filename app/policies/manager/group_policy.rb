class Manager::GroupPolicy < Manager::ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(manager_id: user.id)
    end
  end

  def show?
    record.manager_id == user.id
  end

  def update?
    record.manager_id == user.id
  end

  def delete?
    record.manager_id == user.id
  end

end
