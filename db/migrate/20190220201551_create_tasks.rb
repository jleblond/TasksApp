class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.date :start_date
      t.date :due_date
      t.integer :category_id
      t.integer :status_id
      t.integer :author_id
      t.text :description

      t.timestamps
    end
  end
end
