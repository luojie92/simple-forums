# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    required(:keyword)
    keywords = params[:keyword].split('-')

    # Find or create keyword
    # keywords.each do |keyword|
    #   keyword_instance = Keyword.find_or_create_by(name: keyword)
    #   keyword_instance.search!
    # end

    # conditions
    conditions = []
    conditions << 'title ILIKE ANY (array[?])'
    conditions << 'summary ILIKE ANY (array[?])'
    # options
    keywords_with_pa = keywords.map { |keyword| "%#{keyword}%" }
    options = []
    options << keywords_with_pa
    options << keywords_with_pa
    # rich_texts
    rich_texts = RichText.where('body ILIKE ANY (array[?])', keywords_with_pa)
    if rich_texts.exists?
      conditions << 'id IN (?)'
      options << rich_texts.pluck(:record_id)
    end
    # articles
    @articles = Article.where(conditions.join(' OR '), *options)
    @articles = @articles.preload(:user).order(created_at: :desc).page(params[:page]).per(params[:per_page])
  end
end
