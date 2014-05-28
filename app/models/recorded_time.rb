class RecordedTime < ActiveRecord::Base
  belongs_to :todo_list_item
  belongs_to :user
  
  validates_associated :todo_list_item
  validates_associated :user
  validates :hours, :presence => true
  validates :date, :presence => true
  
  def billable?
    budget = passed = 0
    self.todo_list_item.todo_list.todo_list_items.each do |todo_list_item|
      if todo_list_item == self.todo_list_item
        todo_list_item.recorded_times.each do |recorded_time|
          if passed == 0
            budget += recorded_time.hours
          end
          if recorded_time == self
            passed = 1
          end
        end
      else
        if passed == 0
          budget += todo_list_item.recorded_times.sum(:hours)
        end
      end
    end
    budget <= self.todo_list_item.todo_list.budget
  end
end