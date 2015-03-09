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

  def edit
  end

  def create
    @list = current_user.lists.new list_params
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def update
    if @list.update list_params
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully destroyed.'
  end

private

  def set_list
    @list = current_user.lists.find params[:id]
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
