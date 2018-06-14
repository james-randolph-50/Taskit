class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|

      t.integer :user_id
      t.integer :project_id
      t.datetime :due_date
      t.datetime :completion_date
      t.text :notes

      t.timestamps
    end
  end
end
