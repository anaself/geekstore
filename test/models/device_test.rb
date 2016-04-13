# == Schema Information
#
# Table name: devices
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  mac_adress       :string
#  operating_system :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  model            :string
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
