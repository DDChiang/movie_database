class AddSomeIndexToDirectorsMovies < ActiveRecord::Migration
  def change
    add_index :directors_movies, :movie_id
    add_index :directors_movies, :director_id
    add_index :directors_movies, [:movie_id, :director_id], unique: true
  end
end
