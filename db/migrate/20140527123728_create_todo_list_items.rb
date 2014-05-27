class CreateTodoListItems < ActiveRecord::Migration
  def change
    create_table :todo_list_items do |t|
      t.string :name
      t.references :todo_list, index: true

      t.timestamps
    end
  end
end
