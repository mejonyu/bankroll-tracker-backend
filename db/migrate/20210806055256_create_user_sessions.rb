class CreateUserSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_sessions do |t|
      t.integer :user_id
      t.integer :session_id

      t.timestamps
    end
  end
end
