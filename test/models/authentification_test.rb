# == Schema Information
#
# Table name: authentifications
#
#  id         :integer          not null, primary key
#  local      :json
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AuthentificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
