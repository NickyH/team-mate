# == Schema Information
#
# Table name: competitions
#
#  id         :integer          not null, primary key
#  name       :text
#  start_date :date
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Competition < ActiveRecord::Base
  attr_accessible :name, :start_date, :duration
  has_many :games
end


