class RemoveColumnFromDirectors < ActiveRecord::Migration
  def change
    remove_column :directors, :slug, :string
  end
end
