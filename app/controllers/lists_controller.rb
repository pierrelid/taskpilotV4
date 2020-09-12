class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = policy_scope(List)
  end

  def show
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params.merge(team: current_user.team))
    authorize @list
    @list.save ? redirect_to(list_path(@list)) : render(:new)
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
    authorize @list
  end

  def list_params
    params.require(:list).permit(:name, :qualification_id, :product_id)
  end
end
