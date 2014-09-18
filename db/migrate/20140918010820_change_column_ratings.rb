class ChangeColumnRatings < ActiveRecord::Migration
  def change
    rename_column :ratings, :value, :stars
  end
end
