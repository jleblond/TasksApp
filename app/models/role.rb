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

  validates :role_name, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
end
