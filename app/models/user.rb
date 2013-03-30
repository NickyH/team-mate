# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  phone           :string(255)
#  gender          :string(255)
#  password_digest :string(255)
#  other_teams     :text
#  positions       :text
#  image           :text
#  team_id         :integer
#  is_manager      :boolean          default(FALSE)
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :phone, :password, :password_confirmation, :gender, :other_teams, :positions, :is_manager, :is_admin, :image
  has_many :teams
  has_many :attendees
  validates :email, :password_digest, :presence => true #may cause problems with new user creation
  validates :email, :uniqueness => true
  mount_uploader :image, PlayerPhotosUploader
end


