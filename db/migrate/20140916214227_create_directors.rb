class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :first
      t.string :last
      t.string :slug
      t.boolean :approved, :default => false
      t.date :birthday

      t.timestamps
    end
  end
end
