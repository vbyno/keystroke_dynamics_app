class CreateKeystrokeSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :keystroke_sessions do |t|
      t.text :text, null: false
      t.text :keystrokes, null: false

      t.timestamps
    end
  end
end
