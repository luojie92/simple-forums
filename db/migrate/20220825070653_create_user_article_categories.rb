# frozen_string_literal: true

class CreateUserArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_article_categories do |t|
      t.integer :user_id,             null: false, default: 0
      t.integer :article_category_id, null: false, default: 0
      t.timestamps                    null: false
    end
  end
end
