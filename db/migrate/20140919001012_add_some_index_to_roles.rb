class AddSomeIndexToRoles < ActiveRecord::Migration
  def change
    add_index :roles, :actor_id
    add_index :roles, :movie_id
    add_index :roles, :name
    add_index :roles, [:actor_id, :movie_id]
    add_index :roles, [:actor_id, :movie_id, :name], unique: true
  end
end
