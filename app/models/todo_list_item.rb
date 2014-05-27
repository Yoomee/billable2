class TodoListItem < ActiveRecord::Base
  belongs_to :todo_list
  has_many :recorded_times
end
