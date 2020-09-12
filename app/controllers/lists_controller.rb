class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def create?
  end

  def update?
  end

  def destroy?
  end
end
