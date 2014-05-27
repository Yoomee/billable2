class TodoListItem < ActiveRecord::Base
  belongs_to :todo_list
  has_many :recorded_times
  
  validates :name, presence: true
  validates_associated :todo_list
end
