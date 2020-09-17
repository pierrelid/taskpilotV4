class WorkflowPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(list: user.team.lists)
    end
  end

  def create?
    true
  end

  def show?
    record.list.team = user.team
  end

  def update?
    record.list.team = user.team
  end

  def destroy?
    record.list.team = user.team
  end

  def switch_active?
    record.list.team = user.team
  end
end
