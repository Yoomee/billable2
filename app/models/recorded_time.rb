class RecordedTime < ActiveRecord::Base
  after_create :check_if_non_billable
  
  belongs_to :todo_list_item
  belongs_to :user
  
  validates_associated :todo_list_item
  validates_associated :user
  validates :hours, :presence => true
  validates :date, :presence => true
  
  def check_if_non_billable
    budget = 0
    self.todo_list_item.todo_list.todo_list_items.each do |todo_list_item|
      if todo_list_item == self.todo_list_item
        todo_list_item.recorded_times.each do |recorded_time|
          if recorded_time == self
            if budget > self.todo_list_item.todo_list.budget
              non_billable_time = self.hours
            elsif budget + self.hours > self.todo_list_item.todo_list.budget
              non_billable_time = budget + self.hours - self.todo_list_item.todo_list.budget
            end
            self.non_billable_time = non_billable_time
            self.billable_time = self.hours - non_billable_time
            self.save
          else
            budget += recorded_time.hours
          end
        end
      else
        budget += todo_list_item.recorded_times.sum(:hours)
      end
    end
  end
end