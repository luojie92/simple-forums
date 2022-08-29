# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[destroy]

  def create
    required(:message)
    comment = @article.comments.new(create_params)
    raise UnprocessableEntityError, comment.errors.full_messages.first unless comment.save

    head :ok
  end

  def destroy
    @comment.destroy

    head :ok
  end

  private

  def create_params
    params.permit(:message).merge(from_uid: @current_user.id)
  end

  def update_params
    params.permit(:title, :summary)
  end

  def set_article
    @article ||= Article.find(params[:article_id])
  end

  def set_comment
    @comment ||= @article.comments.find(params[:id] || params[:comment_id])
  end
end
