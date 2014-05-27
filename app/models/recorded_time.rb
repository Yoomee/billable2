class RecordedTime < ActiveRecord::Base
  belongs_to :todo_list_item
  belongs_to :user
  
  validates_associated :todo_list_item
  validates_associated :user
end