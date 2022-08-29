# frozen_string_literal: true

class CreateArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :article_categories do |t|
      t.string  :title,           null: false, default: ''
      t.string  :title_en,        null: false, default: ''
      t.integer :position,        null: false, default: 0
      t.timestamps                null: false
    end
    add_index :article_categories, :title, unique: true
  end
end
