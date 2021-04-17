class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :name, foreign_key: true
  end
end
