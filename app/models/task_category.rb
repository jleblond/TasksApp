# == Schema Information
#
# Table name: task_categories
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskCategory < ActiveRecord::Base
  attr_accessible :category

  validates :category, presence: true, length: { minimum: 1, maximum: 50 }, uniqueness: { case_sensitive: false }

  default_scope order: 'task_categories.category ASC'
end
