namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end


def make_users

  admin_role_id = Role.find_by_role_name("Admin").id


  admin = User.create(name:"admin", email:"admin@example.com", password:"12345678")
  UserRole.create(user_id: admin.id, role_id: admin_role_id)

  j = User.create(name:"Jasmine", email:"jasmine.leblondc@gmail.com", password:"12345678")
  UserRole.create(user_id: j.id, role_id: admin_role_id)


  User.create(name:"User", email:"user@example.com", password:"12345678")
  User.create(name:"Test", email:"test@example.com", password:"12345678")
end