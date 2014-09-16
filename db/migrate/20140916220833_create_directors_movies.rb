class CreateDirectorsMovies < ActiveRecord::Migration
  def change
    create_table :directors_movies do |t|
      t.integer :movie_id
      t.integer :director_id

      t.timestamps
    end
  end
end
