# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update]

  def create
    required(:article_category_id, :title, :summary)
    ActiveRecord::Base.transaction do
      article = Article.create!(create_params)
      article.update_content(params[:content]) if params[:content].present?
    end
  end

  def index
    required(:article_category_id)
    @articles = Article.where(article_category_id: params[:article_category_id])
    @articles = @articles.preload(:user).order(created_at: :desc).page(params[:page]).per(params[:per_page])
  end

  def show
    @comments = @article.comments.preload(:user).order(id: :asc)
  end

  def update
    ActiveRecord::Base.transaction do
      @article.update!(update_params)
      @article.update_content(params[:content]) if params[:content].present?
    end
  end

  private

  def create_params
    params.permit(:article_category_id, :title, :summary).merge(user_id: @current_user.id)
  end

  def update_params
    params.permit(:title, :summary)
  end

  def set_article
    @article ||= Article.find(params[:id] || params[:article_id])
  end
end
