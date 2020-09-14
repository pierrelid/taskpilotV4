class StepsController < ApplicationController
  def index
    @steps = policy_scope(Step)
    @workflow = Workflow.find(params[:workflow_id])
  end

  def new
    @step = Step.new
    authorize @step
    @workflow = Workflow.find(params[:workflow_id])
  end
end
