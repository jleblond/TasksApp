# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  user_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :task_id, :text, :user_id

  belongs_to :task
  belongs_to :user

  validates :task_id, presence: true
  validates :user_id, presence: true
  # validates :text, presence: true
end
