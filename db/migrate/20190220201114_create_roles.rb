class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name

      t.timestamps
    end

 #   Role.create(role_name:"Regular")
    Role.create(role_name:"Admin")
  end


end