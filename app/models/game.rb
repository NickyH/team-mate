# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  date           :date
#  time           :datetime
#  opponent       :text
#  location       :text
#  latitude       :float            default(0.0)
#  longitude      :float            default(0.0)
#  win            :boolean
#  points_for     :integer
#  points_against :integer
#  comments       :text
#  competition_id :integer
#  team_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Game < ActiveRecord::Base
  attr_accessible :date, :time, :opponent, :location, :latitude, :longitude, :invited, :attending, :declined, :win, :points_for, :points_against, :comments
  belongs_to :team
  belongs_to :competition
  has_many :attendees
  before_save :geocode

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import(file)
    games = []
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      game = find_by_id(row["id"]) || new
      game.attributes = row.to_hash.slice(*accessible_attributes)
      game.save!
      games << game
    end
    games
  end

  private
  def geocode
  result = Geocoder.search(self.location).first
  if result.present?
    self.latitude = result.latitude
    self.longitude = result.longitude
  end
  end

end
