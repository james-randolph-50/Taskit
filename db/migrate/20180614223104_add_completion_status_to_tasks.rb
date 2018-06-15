class AddCompletionStatusToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :completion_status, :string
  end
end
