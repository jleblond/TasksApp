# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :string(255)
#  read        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Notification < ActiveRecord::Base
  attr_accessible :description, :read, :user_id

  belongs_to :user

  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  # validates :read, presence: true
  #


  def self.unread
    where(read: false)
  end
end
