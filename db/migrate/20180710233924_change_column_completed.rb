class ChangeColumnCompleted < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :completed
  end
end
