class AddPasswordDigestToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :password_digest, foreign_key: true
  end
end
