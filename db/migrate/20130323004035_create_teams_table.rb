class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.text :team_name
      t.text :sport
      t.text :timezone
      t.text :team_gender
      t.text :manager
      t.integer :user_id
      t.timestamps
  end
end
end
