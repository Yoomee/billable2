class Project < ActiveRecord::Base
  belongs_to :client
  has_many :todo_lists
  
  validates :name, presence: true
  validates_associated :client
  
  def budget
    self.todo_lists.sum(:budget)
  end
end
