class AddSomeIndexOnSpoilers < ActiveRecord::Migration
  def change
    add_index :spoilers, :movie_id
    add_index :spoilers, :user_id
    add_index :spoilers, [:movie_id, :user_id], unique: true
  end
end
