class AddIndexToGenres < ActiveRecord::Migration
  def change
    remove_index :genres, :slug
    add_index :genres, :name
    add_index :genres, :slug
  end
end
