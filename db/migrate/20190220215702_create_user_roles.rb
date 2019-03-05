class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end

    # add_index :users_and_roles, [:user_id, :role_id], unique: true
    add_index(:user_roles, [:user_id, :role_id], unique: true, name: 'users_and_roles')
  end
end
