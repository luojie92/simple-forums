# frozen_string_literal: true

class UserArticleCategory < ApplicationRecord
  belongs_to :user
  belongs_to :article_category
end
