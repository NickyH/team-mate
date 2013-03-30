# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  team_name   :text
#  sport       :text
#  timezone    :text
#  team_gender :text
#  manager     :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Team < ActiveRecord::Base
  attr_accessible :team_name, :sport, :timezone, :team_gender, :manager
  has_many :users
  has_many :games


end

