class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(quote: user.team.quotes)
    end
  end
end
