class QuotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(team: user.team)
    end
  end

  def create?
    true
  end

  def show?
    record.team = user.team
  end

  def update?
    record.team = user.team
  end

  def destroy?
    record.team = user.team
  end
end
