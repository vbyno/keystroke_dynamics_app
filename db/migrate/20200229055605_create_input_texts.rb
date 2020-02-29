class CreateInputTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :input_texts do |t|
      t.string :name, null: false
      t.text :text, null: false
    end
  end
end
