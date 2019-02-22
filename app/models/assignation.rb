# == Schema Information
#
# Table name: assignations
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assignation < ActiveRecord::Base
  attr_accessible :task_id, :user_id

  belongs_to :user
  belongs_to :task

  validates :task_id, presence: true
  validates :user_id, presence: true
end
