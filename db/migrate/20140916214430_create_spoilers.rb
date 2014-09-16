class CreateSpoilers < ActiveRecord::Migration
  def change
    create_table :spoilers do |t|
      t.integer :movie_id
      t.integer :user_id
      t.text :synopsis

      t.timestamps
    end
  end
end
