class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.date :opening_day
      t.text :teaser
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
  end
end
