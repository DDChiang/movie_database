class RemoveIndexFromSpoilers < ActiveRecord::Migration
  def change
    remove_index :spoilers, [:movie_id, :user_id]
  end
end
