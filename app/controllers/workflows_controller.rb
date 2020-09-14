class WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show, :edit, :update, :destroy]

  def index
    @workflows = policy_scope(Workflow)
  end

  def new
    @workflow = Workflow.new
    authorize @workflow
  end

  def show
  end

  def create
    @workflow = Workflow.new(workflow_params)
    authorize @workflow
    @workflow.save ? redirect_to(workflow_path(@workflow)) : render(:new)
  end

  def update
    if @workflow.update(workflow_params)
      redirect_to workflow_path(@workflow)
    else
      render :edit
    end
  end

  private

  def workflow_params
    params.require(:workflow).permit(:name, :list_id)
  end

  def set_workflow
    @workflow = Workflow.find(params[:id])
    authorize @workflow
  end
end
