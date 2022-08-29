# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :article_id,   null: false, default: 0
      t.integer :comment_type, null: false, default: 0
      t.integer :comment_id,   null: false, default: 0
      t.integer :from_uid,     null: false, default: 0
      t.text    :message
      t.timestamps
    end
    add_index :comments, :article_id
    add_index :comments, :from_uid
  end
end
