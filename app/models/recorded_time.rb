class RecordedTime < ActiveRecord::Base
  belongs_to :todo_list_item
  belongs_to :user
end