namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_task_categories
  end
end


def make_users
  a = User.create(name:"admin", email:"admin@example.com", password:"12345678")
  UserRole.create(user_id: a.id, role_id: Role.admin_role.id)

  j = User.create(name:"Jasmine", email:"jasmine.leblondc@gmail.com", password:"12345678")
  UserRole.create(user_id: j.id, role_id: Role.admin_role.id)


  User.create(name:"User", email:"user@example.com", password:"12345678")
  User.create(name:"Test", email:"test@example.com", password:"12345678")
end



def make_task_categories
    TaskCategory.create(category:"Category1")
    TaskCategory.create(category:"Category2")
end
