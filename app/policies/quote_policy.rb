class QuotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(team: user.team)
    end
  end
end
