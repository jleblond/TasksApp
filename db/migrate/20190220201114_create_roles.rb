class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name

      t.timestamps
    end

    Role.create(role_name:"regular")
    Role.create(role_name:"admin")
  end


end