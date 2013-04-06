class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.datetime :time
      t.text :opponent
      t.text :location
      t.float :latitude, :default => 0
      t.float :longitude, :default => 0
      t.boolean :win
      t.integer :points_for
      t.integer :points_against
      t.text :comments
      t.integer :competition_id
      t.integer :team_id
      t.timestamps
    end
  end
end
