class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :chosen_name
      t.text :description

      t.timestamps
    end
  end
end
