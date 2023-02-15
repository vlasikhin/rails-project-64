source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "ancestry"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "devise"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "redis", "~> 4.0"
gem "sentry-rails"
gem "sentry-ruby"
gem "simple_form"
gem "slim"
gem "slim-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "faker"
end

group :development do
  gem "capistrano", "~> 3.17", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem "capistrano-rbenv", "~> 2.2", require: false
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "slim_lint", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "minitest-power_assert"
  gem "selenium-webdriver"
  gem "webdrivers"
end
