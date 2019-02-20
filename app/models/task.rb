# == Schema Information
#
# Table name: tasks
#
#  id                   :integer          not null, primary key
#  task_name            :string(255)
#  start_date           :datetime
#  due_date             :datetime
#  category_category_id :integer
#  status               :string(255)
#  author_id            :integer
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :author_id, :category_category_id, :description, :due_date, :start_date, :status, :task_name
end
