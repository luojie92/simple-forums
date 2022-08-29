# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, on: :create
  validates :password_digest, presence: true

  has_many :articles
  has_many :article_likes
  has_many :comments, primary_key: :id, foreign_key: :from_uid
  has_many :user_article_categories
  has_many :article_categories, through: :user_article_categories
end
