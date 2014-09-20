class AddColumnToActors < ActiveRecord::Migration
  def change
    add_column :actors, :stage_name, :string
  end
end
