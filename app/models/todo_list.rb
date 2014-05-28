class TodoList < ActiveRecord::Base
  belongs_to :project
  has_many :todo_list_items
  
  validates :name, presence: true
  validates :billable, presence: true
  validates :budget, inclusion: [true, false]
  validates_associated :project
end
