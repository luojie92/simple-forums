source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'ancestry'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'caxlsx', '~> 3.0', '>= 3.0.2'
gem 'caxlsx_rails', '~> 0.6.2'
gem 'figaro'
gem 'httparty', '~> 0.18.1'
gem 'jbuilder', '~> 2.7'
gem 'jwt'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'oj'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.1', '>= 5.1.1'
gem 'rack-cors'
gem 'rails', '~> 6.1', '>= 6.1.4.6'
gem 'redis', '~> 4.0'
gem 'spreadsheet', '~> 1.2', '>= 1.2.6'
# gem 'tzinfo-data', platforms: %i[mingw swin x64_mingw jruby]
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-sidekiq'
end
