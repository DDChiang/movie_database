class AddColumnToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :spoiler_id, :integer
  end
end
