class WorkflowsController < ApplicationController
  def index
    @workflows = policy_scope(Workflow)
  end

  def new
    @workflow = Workflow.new
    authorize @workflow
  end

  private

  def workflow_params
    params.require(:workflow).permit(:name, :list_id)
  end
end
