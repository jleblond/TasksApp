# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :title, :body

  attr_accessible :email, :name

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  has_many :tasks_as_author, class_name: "Task", foreign_key: :author_id

  has_many :assignations, dependent: :destroy
  has_many :tasks_assigned, through: :assignations, source: :task

  has_many :comments

  has_many :notifications, dependent: :destroy


  # after_create :add_default_role


  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  default_scope order: 'users.name ASC'

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def admin?
    @admin_role = Role.admin_role
    self.roles.exists?(@admin_role)
  end

  # def regular?
  #   @regular_role = Role.regular_role
  #   self.roles.exists?(@regular_role)
  # end



  private

  # def add_default_role
  #   @regular_role_id = Role.regular_role.id
  #   UserRole.create(user_id: self.id, role_id: @regular_role_id)
  # end




end
