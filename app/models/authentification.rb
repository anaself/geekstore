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

class Authentification < ActiveRecord::Base
  belongs_to :user
end
