class AddUserUuidToKeystrokeSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :keystroke_sessions, :user_uuid, :string, null: false
  end
end
