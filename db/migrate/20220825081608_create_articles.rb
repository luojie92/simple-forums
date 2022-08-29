# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :user_id,             null: false, default: 0
      t.string  :title,               null: false, default: ''
      t.string  :summary,             null: false, default: ''
      t.integer :article_category_id, null: false, default: 0
      t.timestamps                    null: false
    end
  end
end
