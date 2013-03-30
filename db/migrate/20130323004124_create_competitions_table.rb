class CreateCompetitionsTable < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.text :name
      t.date :start_date
      t.integer :duration
      t.timestamps
  end
end
end
