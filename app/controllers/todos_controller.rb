class TodosController < ApplicationController
  before_action :set_list

  def new
    @todo = @list.todos.new
  end

  def create
    @todo = @list.todos.new todo_params
    if @todo.save
      redirect_to @list, notice: 'Todo created'
    else
      render :new
    end
  end

  def complete
    todo = @list.todos.find params[:id]
    todo.complete!
    redirect_to @list, notice: 'Todo completed'
  end

private

  def set_list
    @list = current_user.lists.find params[:list_id]
  end

  def todo_params
    params.require(:todo).permit(:description, :due_on)
  end
end
