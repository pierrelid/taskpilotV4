class StepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(workflow: user.team.workflows)
    end
  end

  def create?
    true
  end
end
