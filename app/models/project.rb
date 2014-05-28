class Project < ActiveRecord::Base
  belongs_to :client
  has_many :todo_lists
  
  validates :name, presence: true
  validates_associated :client
  
  def budget
    budget = 0
    self.todo_lists.each do |todo_lists|
      
    end
  end
end
