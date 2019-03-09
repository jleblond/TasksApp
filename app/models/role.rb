# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  role_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  attr_accessible :role_name

  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :role_name, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }

  def self.admin_role
    Role.find_by_role_name("Admin")
  end

  def self.regular_role
    Role.find_by_role_name("Regular")
  end
end
