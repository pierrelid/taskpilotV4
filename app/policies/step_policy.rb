class StepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(workflow: user.team.workflows)
    end
  end

  def create?
    true
  end

  def update?
    record.workflow.list.team == user.team
  end

  def destroy?
    record.workflow.list.team == user.team
  end

  def move?
    record.workflow.list.team == user.team
  end
end
