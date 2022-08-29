# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# init ArticleCategory
article_category = ArticleCategory.find_or_initialize_by(id: 1)
article_category.title = '话题'
article_category.position = 1
article_category.save!
article_category = ArticleCategory.find_or_initialize_by(id: 2)
article_category.title = '实用'
article_category.position = 2
article_category.save!
