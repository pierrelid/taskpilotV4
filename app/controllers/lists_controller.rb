class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end
end
