# frozen_string_literal: true

json.id @article.id
json.title @article.title
json.summary @article.summary
json.content @article.content&.body
json.article_category @article.article_category.as_json(only: %i[id title])
json.comments do
  json.array! @comments.each do |comment|
    json.id comment.id
    json.user comment.user.as_json(only: %i[id nick_name])
    json.message comment.message
    json.created_at comment.created_at
  end
end
