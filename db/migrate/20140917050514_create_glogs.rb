class CreateGlogs < ActiveRecord::Migration
  def change
    create_table :glogs do |t|
      t.text :log

      t.timestamps
    end
  end
end
