class CreateRecordedTimes < ActiveRecord::Migration
  def change
    create_table :recorded_times do |t|
      t.integer :hours
      t.references :todo_list_item, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
