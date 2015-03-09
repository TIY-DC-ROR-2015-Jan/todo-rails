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

  def show
    @todo = @list.todos.find params[:id]
    response = {
      description: @todo.description,
      list: @list.title,
      numbers: (1..10).to_a
    }
    render json: response.to_json
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
