class RemoveColumnFromActors < ActiveRecord::Migration
  def change
    remove_column :actors, :slug, :string
  end
end
