class AddColumnToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :stage_name, :string
  end
end
