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

require 'spec_helper'

describe Task do
  pending "add some examples to (or delete) #{__FILE__}"
end
