class AddEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :email, foreign_key: true
  end
end
