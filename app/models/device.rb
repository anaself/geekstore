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

class Device < ActiveRecord::Base
  belongs_to :user
end
