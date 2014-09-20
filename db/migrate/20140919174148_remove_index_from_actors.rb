class RemoveIndexFromActors < ActiveRecord::Migration
  def change
    remove_index :actors, [:first, :last, :birthday]
  end
end
