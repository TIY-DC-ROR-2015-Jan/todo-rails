class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists.all
  end

  def show
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new create_params
    if @list.save
      redirect_to @list, notice: 'List created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update update_params
      redirect_to @list, notice: 'List updated'
    else
      render :edit
    end
  end

  def delete
    @list.delete
    redirect_to lists_path, danger: 'List deleted'
  end

private

  def set_list
    @list = current_user.lists.find params[:id]
  end

  def create_params
    params.require(:list).permit(:title)
  end

  def update_params
    create_params
  end
end
