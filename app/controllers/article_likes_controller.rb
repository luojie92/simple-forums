# frozen_string_literal: true

class ArticleLikesController < ApplicationController
  before_action :set_article
  before_action :set_article_like, only: %i[destroy]

  def create
    article_like = @article.article_likes.new(create_params)
    raise UnprocessableEntityError, article_like.errors.full_messages.first unless article_like.save

    head :ok
  end

  def destroy
    @article_like.destroy

    head :ok
  end

  private

  def create_params
    { user_id: @current_user.id }
  end

  def update_params
    params.permit(:title, :summary)
  end

  def set_article
    @article ||= Article.find(params[:article_id])
  end

  def set_article_like
    @article_like ||= @article.article_likes.find(params[:id] || params[:article_like_id])
  end
end
