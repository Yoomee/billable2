class TodoList < ActiveRecord::Base
  belongs_to :project
  has_many :todo_list_items
end
