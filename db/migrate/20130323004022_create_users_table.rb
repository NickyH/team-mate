class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :gender
      t.string :password_digest
      t.text :current_team
      t.text :positions
      t.text :image
      t.integer :team_id
      t.boolean :is_manager, :default => false
      t.boolean :is_admin, :default => false
      t.timestamps
  end
end
end


