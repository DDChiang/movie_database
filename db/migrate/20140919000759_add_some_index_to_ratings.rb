class AddSomeIndexToRatings < ActiveRecord::Migration
  def change
    add_index :ratings, :user_id
    add_index :ratings, :movie_id
    add_index :ratings, [:user_id, :movie_id], unique: true
    add_index :ratings, :stars
  end
end
