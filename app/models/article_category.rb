# frozen_string_literal: true

class ArticleCategory < ApplicationRecord
  has_many :articles
  has_many :user_article_categories
  has_many :users, through: :user_article_categories
end
