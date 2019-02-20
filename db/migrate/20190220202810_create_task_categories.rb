class CreateTaskCategories < ActiveRecord::Migration
  def change
    create_table :task_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end
