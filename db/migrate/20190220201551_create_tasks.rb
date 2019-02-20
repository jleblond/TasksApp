class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.datetime :start_date
      t.datetime :due_date
      t.integer :category_id
      t.string :status
      t.integer :author_id
      t.text :description

      t.timestamps
    end
  end
end
