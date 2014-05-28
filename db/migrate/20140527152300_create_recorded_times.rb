class CreateRecordedTimes < ActiveRecord::Migration
  def change
    create_table :recorded_times do |t|
      t.references :todo_list_item, index: true
      t.references :user, index: true
      t.integer :hours
      t.date :date
      t.string :description
      
      t.timestamps
    end
  end
end
