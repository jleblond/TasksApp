# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  task_name   :string(255)
#  start_date  :date
#  due_date    :date
#  category_id :integer
#  status_id   :integer
#  author_id   :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :author_id, :category_id, :description, :due_date, :start_date, :status_id, :task_name

  belongs_to :category, class_name: 'TaskCategory', foreign_key: "category_id"

  belongs_to :author, class_name: 'User', foreign_key: "author_id"

  belongs_to :status, class_name: 'TaskStatus', foreign_key:"status_id"

  has_many :assignations
  has_many :users_assigned, through: :assignations, source: :user
  accepts_nested_attributes_for :users_assigned

  has_many :comments


  validates :task_name, presence: true, length: { maximum: 50 }
  validates :due_date, presence: true
  # validates :category_id, presence: true
  validates :author_id, presence: true
  # validates :description, presence: true

end
