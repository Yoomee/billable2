class Project < ActiveRecord::Base
  belongs_to :client
  has_many :todo_lists
end
