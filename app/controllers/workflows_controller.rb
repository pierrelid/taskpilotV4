class WorkflowsController < ApplicationController
  def index
    @workflows = policy_scope(Workflow)
  end
end
