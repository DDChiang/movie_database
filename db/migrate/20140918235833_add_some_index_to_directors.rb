class AddSomeIndexToDirectors < ActiveRecord::Migration
  def change
    add_index :directors, :first
    add_index :directors, :last
    add_index :directors, [:first, :last]
    add_index :directors, [:first, :last, :birthday], unique: true
  end
end
