class CreateAttendeesTable < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :game_id
      t.integer :user_id
      t.text :status
    end
  end
end
