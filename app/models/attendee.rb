# == Schema Information
#
# Table name: attendees
#
#  id      :integer          not null, primary key
#  game_id :integer
#  user_id :integer
#  status  :text
#

class Attendee < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :status
  belongs_to :user
  belongs_to :game

end
