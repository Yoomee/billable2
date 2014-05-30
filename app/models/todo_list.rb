class TodoList < ActiveRecord::Base
  belongs_to :project
  has_many :todo_list_items
  
  validates :name, presence: true
  validates :billable, inclusion: [true, false]
  validates :budget, presence: true
  validates_associated :project
end
