class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :password_digest, foreign_key: true
  end
end
