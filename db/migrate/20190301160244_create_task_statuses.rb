class CreateTaskStatuses < ActiveRecord::Migration
  def change
    create_table :task_statuses do |t|
      t.string :status

      t.timestamps
    end

    TaskStatus.create(status:"Completed")
    TaskStatus.create(status:"Cancelled")
    TaskStatus.create(status:"Modified")
    TaskStatus.create(status:"Reassigned")
  end
end
