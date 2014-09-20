class AddSomeIndexToActors < ActiveRecord::Migration
  def change
    add_index :actors, :first
    add_index :actors, :last
    add_index :actors, [:first, :last]
    add_index :actors, [:first, :last, :birthday], unique: true
  end
end
