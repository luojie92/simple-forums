# frozen_string_literal: true

json.total_count @articles.count
json.articles do
  json.array! @articles.each do |article|
    json.id article.id
    json.title article.title
    json.summary article.summary
    json.user article.user.as_json(only: %i[id nick_name])
  end
end
