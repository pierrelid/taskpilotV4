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

  def edit
    @step = Step.find(params[:id])
    authorize @step
  end

  def update
    @step = Step.find(params[:id])
    @workflow = @step.workflow
    authorize @step
    if @step.update(step_params)
      redirect_to workflow_steps_path(@workflow)
    else
      render :edit
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @workflow = @step.workflow
    authorize @step
    @step.destroy
    redirect_to workflow_steps_path(@workflow)
  end

  def move
    @step = Step.find(params["id"])
    authorize @step
    @step.insert_at(params[:position].to_i + 1)
    head :ok
  end

  private

  def step_params
    if params["delay_step"].present?
      params.require(:delay_step).permit(:type, :title, :body, :delay, :postion)
    elsif params["delay_step"].present?
      params.require(:email_step).permit(:type, :title, :body, :delay, :postion)
    elsif params["sms_step"].present?
      params.require(:sms_step).permit(:type, :title, :body, :delay, :postion)
    else
      params.require(:step).permit(:type, :title, :body, :delay, :postion)
    end
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
