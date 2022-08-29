# frozen_string_literal: true

class CreateRichTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :rich_texts do |t|
      t.string  :record_type,         null: false, default: ''
      t.integer :record_id,           null: false, default: 0
      t.text    :body,                size: :long
      t.timestamps                    null: false
    end
    add_index :rich_texts, %i[record_type record_id], unique: true
  end
end
