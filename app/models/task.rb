# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  task_name   :string(255)
#  start_date  :datetime
#  due_date    :datetime
#  category_id :integer
#  status      :string(255)
#  author_id   :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :author_id, :category_id, :description, :due_date, :start_date, :status, :task_name

  belongs_to :category, class_name: 'TaskCategory'

  belongs_to :author, class_name: 'User', foreign_key: "author_id"

  has_many :assignations
  has_many :users_assigned, through: :assignations, source: :user

  has_many :comments

  # validates :task_name, presence: true, length: { maximum: 50 }
  # validates :due_date, presence: true
  # validates :category_id, presence: true
  # validates :author_id, presence: true
  # validates :description, presence: true
end
