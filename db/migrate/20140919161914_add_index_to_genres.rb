class AddIndexToGenres < ActiveRecord::Migration
  def change
    add_index :genres, :name
    add_index :genres, :slug
  end
end
