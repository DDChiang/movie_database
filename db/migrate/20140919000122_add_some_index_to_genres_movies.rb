class AddSomeIndexToGenresMovies < ActiveRecord::Migration
  def change
    add_index :genres_movies, :genre_id
    add_index :genres_movies, :movie_id
    add_index :genres_movies, [:genre_id, :movie_id], unique: true
  end
end
