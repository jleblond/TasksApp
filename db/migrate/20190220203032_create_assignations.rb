class CreateAssignations < ActiveRecord::Migration
  def change
    create_table :assignations do |t|
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
