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

  def create
    @step = set_step_model
    authorize @step
    @workflow = Workflow.find(params[:workflow_id])
    @step.workflow = @workflow
    if @step.save
      redirect_to workflow_steps_path(@workflow)
    else
      @step = Step.new(
        title: step_params[:title],
        body: step_params[:body],
        delay: step_params[:delay],
      )
      render :new
    end
  end

  private

  def step_params
    params.require(:step).permit(:type, :title, :body, :delay)
  end

  def set_step_model
    case step_params[:type]
    when "EmailStep"
      EmailStep.new(step_params)
    when "SmsStep"
      SmsStep.new(step_params)
    when "DelayStep"
      DelayStep.new(step_params)
    else
      Step.new(step_params)
    end
  end
end
