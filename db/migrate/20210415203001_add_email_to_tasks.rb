class AddEmailToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :email, foreign_key: true
  end
end
