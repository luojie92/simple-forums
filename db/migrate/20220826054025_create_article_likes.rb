# frozen_string_literal: true

class CreateArticleLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :article_likes do |t|
      t.integer :article_id,   null: false, default: 0
      t.integer :user_id,      null: false, default: 0
      t.timestamps
    end
    add_index :article_likes, %i[article_id user_id], unique: true
  end
end
