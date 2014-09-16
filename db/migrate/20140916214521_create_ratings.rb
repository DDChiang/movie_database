class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :movie_id
      t.text :review
      t.float :value
      t.boolean :review_present, :default => false

      t.timestamps
    end
  end
end
