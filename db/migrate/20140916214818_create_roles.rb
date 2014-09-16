class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :actor_id
      t.integer :movie_id
      t.string :slug
      t.string :name

      t.timestamps
    end
  end
end
