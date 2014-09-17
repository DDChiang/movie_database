class AddTextLogToUsers < ActiveRecord::Migration
  def change
    add_column :users, :log, :text
  end
end
