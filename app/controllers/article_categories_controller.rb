# frozen_string_literal: true

class ArticleCategoriesController < ApplicationController
  before_action :set_article_category, only: %i[show join]
  before_action :need_joined, only: %i[show]

  def index
    @article_categories = ArticleCategory.all
    @article_categories = @article_categories.order(position: :asc)
    render json: { article_categories: @article_categories.as_json(only: %i[id title]) }
  end

  def show
    render json: { article_category: @article_category.as_json(only: %i[id title]) }
  end

  def join
    raise UnprocessableEntityError, 'Repeat joined' if @article_category.users.where(id: @current_user.id).exists?

    item = @article_category.user_article_categories.new(user_id: @current_user.id)
    raise UnprocessableEntityError, item.errors.full_messages.first unless item.save

    head :ok
  end

  private

  def set_article_category
    @article_category ||= ArticleCategory.find(params[:id] || params[:article_category_id])
  end

  def need_joined
    return if @article_category.users.where(id: @current_user.id).exists?

    raise UnprocessableEntityError, 'Not joined'
  end
end
