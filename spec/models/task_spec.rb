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

require 'spec_helper'

describe Task do
  pending "add some examples to (or delete) #{__FILE__}"
end
