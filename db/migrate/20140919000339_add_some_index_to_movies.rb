class AddSomeIndexToMovies < ActiveRecord::Migration
  def change
    add_index :movies, :name
    add_index :movies, :opening_day
    add_index :movies, :user_id
    #didn't add index for slug bc slug starts with id, no need to change
  end
end
