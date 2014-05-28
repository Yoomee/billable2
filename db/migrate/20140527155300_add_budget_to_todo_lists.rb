class AddBudgetToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :budget, :interger
  end
end