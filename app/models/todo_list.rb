class TodoList < ActiveRecord::Base
  belongs_to :project
  has_many :todo_list_items
  
  after_save :reset_budget
  
  validates :name, presence: true
  validates :billable, inclusion: [true, false]
  validates :budget, presence: true
  validates_associated :project
  
  def reset_budget
    self.update_column(:budget, 0) if !self.billable?
    self.todo_list_items.each do |todo_list_item|
      todo_list_item.recorded_times.each do |recorded_time|
        recorded_time.check_if_non_billable
      end
    end
  end
end
