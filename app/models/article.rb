# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_category
  has_many :comments
  has_many :article_likes
  has_one :content, -> { where(record_type: 'Article') }, class_name: 'RichText', primary_key: :id, foreign_key: :record_id

  def update_content(text)
    content ||= RichText.new(record_type: self.class.name, record_id: id)
    content.body = text
    content.save!
  end
end
