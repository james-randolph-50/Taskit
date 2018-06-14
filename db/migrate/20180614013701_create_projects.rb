class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|

      t.string :name
      t.integer :cycle
      t.datetime :last_completed

      t.timestamps
    end
  end
end
